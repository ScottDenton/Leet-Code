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



# *************   Pascals Triangle

def generate(num_rows)
  triangle = []
  num_rows.times do |i|
    triangle.push([1]) if i == 0      # if its one of the first two add the ones accordingly
    triangle.push([1,1]) if i ==1

    if i > 1                          #if its more than two push an empty array
      triangle.push([])
      triangle[i].push(1)             #start it with a 1
      (1...i).each do |j|             # depending on the row number(each row length is equal to the row number)
        triangle[i].push(triangle[i-1][j-1] + triangle[i-1][j]) # add the items above together to find its total
      end
    triangle[i].push(1)               # push a 1 onto the end when your done with the row.
    end
  end
  triangle                            #return the triangle
end

# *********      PASCALS TRIANGLE II - recursive
def get_row(row_index, triangle = [], i = 0)
  return triangle[i-1]  if i == row_index +1
  triangle.push([1]) if i == 0
  triangle.push([1,1]) if i == 1
  if i > 1
    triangle[i] = [1]
    (1...i).each do |j|
      triangle[i].push(triangle[i-1][j-1] + triangle[i-1][j])
    end
    triangle[i].push(1)
  end
  get_row(row_index, triangle, i +1)
end
p get_row(7)
