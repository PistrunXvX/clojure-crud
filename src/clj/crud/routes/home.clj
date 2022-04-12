(ns crud.routes.home
  (:require
   [crud.layout :as layout]
   [crud.db.core :as db]
   [clojure.java.io :as io]
   [crud.middleware :as middleware]
   [ring.util.response]
   [ring.util.http-response :as response]
   [struct.core :as st]))

(def patient-schema
 [[:first_name
   st/required
   st/string
   {:message "Превышено количество символов"
    :validate #(< (count %) 100)}]
   
  [:second_name
   st/required
   st/string
   {:message "Превышено количество символов"
    :validate #(< (count %) 100)}]
   
  [:middle_name
   st/required
   st/string
   {:message "Превышено количество символов"
    :validate #(< (count %) 100)}]
    
  [:gender
   st/required
   st/string]
   
   [:birthday_date
    st/required
   {:message "Ошибка"}]
    
   [:address_name
    st/required
    st/string
    {:message "Ошибка"}]
    
   [:policy_number
    st/required
    st/string
    {:message "Полис ОМС состоит из 16 чисел"
     :validate #(= (count %) 16)}]])

(defn validate-patient [params]
  (first (st/validate params patient-schema)))

(defn save-patient! [{:keys [params]}]
  (if-let [errors (validate-patient params)]
    (-> (response/found "/patient")
        (assoc :flash (assoc params :errors errors)))
    (do
      (db/create-patient! params)
      (response/found "/patient"))))

(defn delete-patient! [{:keys [params]}]
  (db/delete-patient! {:id (read-string (:id params))})
  (response/found "/"))

(defn update-patient! [{:keys [params]}]
  (if-let [errors (validate-patient params)]
    (-> (response/found (format "/patient/%s" (:id params)))
        (assoc :flash (assoc params :errors errors)))
    (do
      (db/update-current-patient! params)
      (response/found "/"))))

(defn home-page [request]
  (layout/render request "home.html" {:patients (db/get-patient)})) 

(defn create-patient-page [{:keys [flash] :as request}]
  (layout/render request "patient.html"
    (select-keys flash [:first_name :second_name :middle_name
                        :gender :birthday_date :address_name :policy_number :errors])))

(defn update-page-patient [{:keys [flash path-params] :as request}]
  (layout/render request "change.html"
    (merge {:patient-old (db/get-current-patient {:id (read-string (:id path-params))})}
      (select-keys flash [:first_name :second_name :middle_name
        :gender :birthday_date :address_name :policy_number :id :errors]))))

(defn home-routes []
  [ "" 
   {:middleware [middleware/wrap-formats]}
   ["/"        {:get home-page}]
   ["/delete" {:post delete-patient!}]
   ["/patient" {:get create-patient-page 
                :post save-patient!}]
   ["/patient/:id" {:get update-page-patient
                    :post update-patient!}]])

