#randomly generate numbers 1-99
#number pool 5-16


class BST extends Node2D:
	var root
	var left_child
	var right_child
	var number_pool
	var preordersort = []
	var linearsort = []
	var postordersort = []
	var sortselector = randi_range(1,4)

	func randomgen():
		var number_pool_size = randi_range(5,17)
		var number_pool = []
		var i = 0
		while i < number_pool_size:
			number_pool_size.append(randi_range(1,100))
			i += 1
		for x in number_pool:
			for y in number_pool:
				if x == y:
					number_pool.erase(number_pool[x])
		if len(number_pool) < number_pool_size:
			var diff = number_pool_size - len(number_pool)
			var j = 0
			while j < diff:
				number_pool_size.append(randi_range(1,100))
				j += 1
		print(number_pool)
		return number_pool
	
	func insert(data):
		if root == false:
			root = Node.new
		else:
			left_child = root.add_child
			right_child = root.add_child
			insert_node(data,root)
	
	func insert_node(data,Node):
		if data < Node.data:
			if Node.left_child:
				insert_node(data,Node.left_child)
			else:
				Node.left_child = data
		else:
			if Node.right_node:
				insert_node(data,Node.right_child)
			else:
				Node.right_child = data
				
	
	func traverse():
		if root != false:
			if sortselector == 1:
				preordertraversal(root)
			elif sortselector == 2:
				traversal(root)
			else:
				postordertraversal(root)
		
	func traversal(node):
		if node.left_node:
			traversal(node.left_node)
		print(node.data)
		linearsort.append(node.right_node)
		
		if node.right_node:
			traversal(node.right_node)
			
	func preordertraversal(node):
		print(node.data)
		preordersort.append(node.data)
		
		if node.left_node:
			preordertraversal(node.left_node)
			
		if node.right_node:
			preordertraversal(node.right_node)
			
	func postordertraversal(node):
		if node.left_node:
			postordertraversal(node.left_node)
		
		if node.right_node:
			postordertraversal(node.right_node)
			
		print(node.data)
		postordersort.append(node.data)
		
	func firstsort(number_pool):
		var sorted_number_pool = number_pool.sort
		var median = len(sorted_number_pool)/2
		var root = sorted_number_pool[median]
		number_pool.remove(root)
		number_pool.insert(0,root)
		sorted_number_pool.remove(root)
		sorted_number_pool.insert(0,root)
		return number_pool
		
	func BSTbuilding(BST,num_pool):
		var i = 0
		while i < len(number_pool):
			BST.insert(number_pool[i])
			i += 1
		BST.traverse()
		if sortselector == 1:
			print("Preorder sort:",preordersort)
		elif sortselector == 2:
			print("Linear sort:",linearsort)
		else:
			print("Postorder sort:",postordersort)
		
		
		
		
	func _ready():
		var sortednumberpool = firstsort(randomgen())
		BSTbuilding(BST,sortednumberpool)
		

