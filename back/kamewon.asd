(asdf:defsystem :kamewon
  :serial t
  :components (
               (:file "config")
               (:file "file-server")
               (:file "handlers")
               (:file "file-client"))
  :depends-on (
               :hunchentoot
               :lparallel
               :pathname
               :yason
               :jonathan
               :filelib
               :zip :dexador))
