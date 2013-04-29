require_relative "../fast-exp"

describe "#fast_exp" do
  it "calculates the exp" do
    fast_exp(2, 8).should eq 256
    fast_exp(3, 2).should eq 9
  end
end

describe "#fast_exp_i" do
  it "calculates the exp" do
    fast_exp_i(3, 9).should eq(fast_exp(3, 9))
    p fast_exp_i(3, 1000000)
  end
end

describe "#fast_exp_ruby" do
  it "calculates the exp" do
    fast_exp_ruby(3, 9).should eq(fast_exp(3, 9))
    p fast_exp_ruby(3, 1000000)
  end
end
