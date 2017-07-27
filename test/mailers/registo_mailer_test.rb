require 'test_helper'

class RegistoMailerTest < ActionMailer::TestCase
  test "novo_registo" do
    mail = RegistoMailer.novo_registo
    assert_equal "Novo registo", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
