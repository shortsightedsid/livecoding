(defsystem "livecoding"
  :description "livecoding: A simple library that enables coding on a live/running system."
  :version "0.0.1"
  :author "Sid Heroor"
  :license "BSD 2 Clause"
  :depends-on ("swank")
  :components ((:file "package")
		(:file "livecoding")))
