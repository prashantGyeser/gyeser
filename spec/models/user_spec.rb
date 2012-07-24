require 'spec_helper'

describe User do
  before{@user=User.new(email: "prashant@gyeser.com", password: "password@123")}

  subject{@user}

  it{should respond_to(:email)}
  it{should respond_to(:password)}

end
