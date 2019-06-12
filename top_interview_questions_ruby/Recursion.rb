# ****      Recursively swap node pairs

def swap_pairs(head)
  # if there is no head return nil
    return nil unless head
    #create a new node to help with rearrangement
    new_head = ListNode.new(nil)
    #if there is no next, return head (ie its the end of the list)
    return head if !head.next
    # set the new node to the 2nd node in line
    new_head = head.next
    # set what was the head(soon to be second)'s next to point to same function, repeating process on next pair
    head.next = swap_pairs(new_head.next)
    #make the new head point to the original, pushing it to second place in line
    new_head.next = head
    #at the end return the new head
    new_head
end
