require 'rspec'
require 'binary_search_tree'

describe BinaryNode do
  subject(:node) { BinaryNode.new(5, 5, nil) }
  # its(:suit) { should be (:diamond) }
  # its(:value) { should eql (:queen) }

  describe "#is_leaf?" do
    it "returns true when height is 0" do
      expect(node.is_leaf?).to be_true
    end

    it "returns false when height is not 0" do
      node.height = 1
      expect(node.is_leaf?).to be_false
    end
  end

  describe "#max_children_height" do

    before(:each) do
      @left = double('left_child', :present? => true, :height => 3)
      @right = double('right_child', :present? => true, :height => 2)
      node.left, node.right = @left, @right
    end
    context "when both children are present and the left has a greater height" do
      it "returns the value of the left child's height" do
        expect(node.max_children_height).to eql(3)
      end
    end

    context "when both children are present and right has a greater height" do
      it "returns the value of the right child's height" do
        @right.stub(:height).and_return(4)
        expect(node.max_children_height).to eql(4)
      end
    end

    context "when only the left child is present" do
      it "returns the value of the left child's height" do
        @right.stub(:present?).and_return(false)
        expect(node.max_children_height).to eql(3)
      end
    end

    context "when only the right child is present" do
      it "returns the value of the right child's height" do
        @left.stub(:present?).and_return(false)
        expect(node.max_children_height).to eql(2)
      end
    end
  end





end

