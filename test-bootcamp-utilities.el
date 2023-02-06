(require 'ert)

(ert-deftest sanitize-string-test ()
  (should (equal (sanitize-string-for-filename "This is a Test String") "this_is_a_test_string"))
  (should (equal (sanitize-string-for-filename "Test_String!@#$%^&*()") "test_string"))
  (should (equal (sanitize-string-for-filename "Test String 123") "test_string_123")))
