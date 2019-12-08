def person_is_seller?(name)
  name[-1] == "m"
end

class Graph < Hash
  def search(name)
    search_queue = []
    search_queue += self[name]
    # This array is how you keep track of which people you've searched before.
    searched = {}

    until search_queue.empty?
      pp searched
      person = search_queue.shift
      # Only search this person if you haven't already searched them.
      next if searched[person]
      return person if yield person
      search_queue += self[person]
        # Marks this person as searched
      searched[person] = true
    end

    false
  end
end


# %w(string1 string2 ...) is a shorter way to define arrays of strings
graph = Graph.new
graph["you"] = %w(alice bob claire)
graph["bob"] = %w(anuj peggy)
graph["alice"] = %w(peggy)
graph["claire"] = %w(thom jonny)
graph["anuj"] = []
graph["peggy"] = []
graph["thom"] = []
graph["jonny"] = []

graph.search("you"){|person| person_is_seller?(person) }.tap{|person| puts "#{person} is a mango seller!" if person}
