(ns crud.db.core-test
  (:require
   [crud.db.core :refer [*db*] :as db]
   [java-time.pre-java8]
   [luminus-migrations.core :as migrations]
   [clojure.test :refer :all]
   [next.jdbc :as jdbc]
   [crud.config :refer [env]]
   [mount.core :as mount]))

(use-fixtures
  :once
  (fn [f]
    (mount/start
     #'crud.config/env
     #'crud.db.core/*db*)
    (migrations/migrate ["migrate"] (select-keys env [:database-url]))
    (f)))

(deftest test-patients
;; Обычная запись пациента - ожидаемый результат 1 
  (is (= 1 (db/create-patient! {:first_name "Евгений"
                                :second_name "Горячкин"
                                :middle_name "Максимович"
                                :gender "male"
                                :birthday_date "01-11-2001"
                                :address_name "Москва"
                                :policy_number "2349127561045628"})))
  ;; Получение не существующей записи - ожидаемый результат 0
  (is (= nil (db/get-current-patient {:id 0})))
  ;; Обновление записи пацента - ожидаемый результат 1
  (is (= 1 (db/update-current-patient! {:id (get (db/test-get-id-by-policy-number {:policy_number "2349127561045628"}) :id)
                                       :first_name "Евгений"
                                       :second_name "Горячкин"
                                       :middle_name "Максимович"
                                       :gender "female"
                                       :birthday_date "01-11-2001"
                                       :address_name "Москва"
                                       :policy_number "2349127561045628"})))
  ;; Удаление не существующей записи - ожидаемый результат 0
  (is (= 0 (db/delete-patient! {:id 0})))
  ;; Удаление записи пациента - ожидаемый результат 1
  (is (= 1 (db/delete-patient! {:id (get (db/test-get-id-by-policy-number {:policy_number "2349127561045628"}) :id)})))
  )