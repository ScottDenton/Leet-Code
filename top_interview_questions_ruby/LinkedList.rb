# ********      DELETE NODE IN A LINKED LIST **********


def delete_node(node)
  # sets the given nodes value to the value of the next item in line
    node.val = node.next.val
    # sets the given nodes 'next' to the value of the next in lines next value
    node.next = node.next.next
end
