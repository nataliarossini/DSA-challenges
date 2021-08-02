class Graph
    def initialize
        @nodes_count = 0
        @adjacent_list = {}
    end

    def add_vertex(node)
        if !@adjacent_list[node]
            @adjacent_list[node] = []
            @nodes_count += 1
            @adjacent_list
        end
    end

    def add_edge(node1, node2)
        @adjacent_list[node1] = [] if !@adjacent_list[node1]
        @adjacent_list[node2] = [] if !@adjacent_list[node2]

        @adjacent_list[node1] << node2
        @adjacent_list[node2] << node1
    end

    def show_connections
        all_nodes = @adjacent_list.keys
        all_nodes.each do |node|
            node_connections = @adjacent_list[node]
            connections = ''
            node_connections.each do |vertex|
                connections += vertex + ' '
            end
            puts node + '-->' + connections
        end
    end
end

my_graph = Graph.new

p my_graph.add_vertex('0');
my_graph.add_vertex('1');
my_graph.add_vertex('2');
my_graph.add_vertex('3');
my_graph.add_vertex('4');
my_graph.add_vertex('5');
my_graph.add_vertex('6');
my_graph.add_edge('3', '1'); 
my_graph.add_edge('3', '4'); 
my_graph.add_edge('4', '2'); 
my_graph.add_edge('4', '5'); 
my_graph.add_edge('1', '2'); 
my_graph.add_edge('1', '0'); 
my_graph.add_edge('0', '2'); 
my_graph.add_edge('6', '5');

p my_graph.show_connections