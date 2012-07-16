require 'spec_helper'

class TestProcessor
  include MailLink::Processor
end


describe MailLink::Processor do
  before do
    @message = "this is a message"
    @processor = TestProcessor.clone.new(@message)
  end

  describe "configuration" do
    it "should retain username" do
      @processor.class.send("username", "test@user.com")
      @processor.class.send("username").should == "test@user.com"
    end

    it "should retain password" do
      @processor.class.send("password", "123")
      @processor.class.send("password").should == "123"
    end
  end

  describe "initialization" do
    it "should make the message available to the instance" do
      @processor.message.should == @message
    end
  end
end