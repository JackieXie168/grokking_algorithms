#include <iostream>
#include <unordered_map>
#include <string>
#include <vector>
#include <limits>
#include <algorithm>

namespace
{
  using node_t = std::string;
  using node_cost_t = std::unordered_map<node_t, unsigned>;
  using graph_t = std::unordered_map<node_t, node_cost_t>;
  using parent_graph_t = std::unordered_map<node_t, node_t>;

  std::vector<std::string> processed;
  auto max = std::numeric_limits<unsigned>::max();
  const node_t find_lowest_cost_node(const node_cost_t& costs)
  {
    auto lowest_cost = max;
    node_t lowest_cost_node{};
    // Go through each node in the costs graph
    for (const auto& nodeCost : costs)
    {
      const auto& cost = nodeCost.second;
      const auto& node = nodeCost.first;
      // Check if this node is processed or not;
      bool isNotProcessed = std::find(processed.cbegin(), processed.cend(), node) == processed.cend();
      // Find the lowest cost node
      if (cost < lowest_cost && isNotProcessed)
      {
        lowest_cost = cost;
        lowest_cost_node = node;
      }
    }
    return lowest_cost_node;
  }
}

int main(void)
{
  // Setup graph
  graph_t graph;
  graph.emplace("start", node_cost_t{{"a", 6}, {"b", 2}});
  graph.emplace("a", node_cost_t{{"finish", 1}});
  graph.emplace("b", node_cost_t{{"a", 3},{"finish", 5}});
  graph.emplace("finish", node_cost_t{});
  // Setup costs table
  node_cost_t costs{{"a", 6},{"b", 2},{"finish", max}};
  // Setup parents table
  parent_graph_t parents{{"a", "start"}, {"b", "start"}};
  // node is "b" at this time
  auto node = find_lowest_cost_node(costs);
  while (!node.empty())
  {
    const auto costSoFar = costs[node];
    const auto& neighbours = graph[node];
    // Loop through all the nodes
    for (const auto& neighbour : neighbours)
    {
      const auto newCost = costSoFar + neighbour.second;
      const auto& currentNeighbourName = neighbour.first;
      // If it is cheaper than the cost registered in the costs graph, update the costs graph
      if (newCost < costs[currentNeighbourName])
      {
        costs[currentNeighbourName] = newCost;
        parents[currentNeighbourName] = node;
      }
    }
    // Mark the current node as processed
    processed.push_back(node);
    // Find the next node to process. If they are all processed, this will return an empty string.
    node = find_lowest_cost_node(costs);
  }
  std::cout << "Cost from the start to each node:" << std::endl;
  std::for_each(costs.cbegin(),
                costs.cend(),
                [](const std::pair<node_t, unsigned>& cost) { std::cout << cost.first << " " << cost.second << std::endl; });
  return 0;
}
