require('rspec')
require('pg')
require('list')
require('spec_helper')

describe(List) do
  describe("list") do
    it("starts off with no lists") do
      bob = List.new()
      expect(bob.list()).to(eq({'q' => 1}))
    end
    # it("lists things once they are there") do
    #
    #   expect(list.name()).to(eq("Epicodus stuff"))
    # end
  end

end
