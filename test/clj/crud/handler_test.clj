(ns crud.handler-test
  (:require
    [clojure.test :refer :all]
    [ring.mock.request :refer :all]
    [crud.handler :refer :all]
    [crud.middleware.formats :as formats]
    [muuntaja.core :as m]
    [mount.core :as mount]))

(defn parse-json [body]
  (m/decode formats/instance "application/json" body))

(use-fixtures
  :once
  (fn [f]
    (mount/start #'crud.config/env
                 #'crud.handler/app-routes)
    (f)))

(deftest test-app-routs
  (testing "route accessible"
    (testing "main rout"
      (let [response ((app) (request :get "/"))]
        (is (= 200 (:status response)))))
    (testing "patient rout"
      (let [response ((app) (request :get "/patient"))]
        (is (= 200 (:status response)))))
    (testing "patient change rout"
      (let [response ((app) (request :get "/patient/20"))]
        (is (= 200 (:status response)))))))

(deftest test-post-routs
  (testing "create patient"
    (let [response ((app) (request :post "/patient"))]
      (is (= 302 (:status response)))))
  (testing "update patient"
    (let [response ((app) (request :post "/patient/20"))]
      (is (= 302 (:status response))))))
