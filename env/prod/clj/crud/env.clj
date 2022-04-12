(ns crud.env
  (:require [clojure.tools.logging :as log]))

(def defaults
  {:init
   (fn []
     (log/info "\n-=[crud started successfully]=-"))
   :stop
   (fn []
     (log/info "\n-=[crud has shut down successfully]=-"))
   :middleware identity})
