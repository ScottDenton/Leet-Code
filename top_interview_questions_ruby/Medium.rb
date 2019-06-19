def max_increase_keeping_skyline(grid)
  size = grid[0].length
# find the top view max's and save to an array
  top_max = Array.new(size, 0)
  for i in grid
    for j in (0..(size-1))
     if i[j] > top_max[j]
        top_max[j] = i[j]
     end
    end
  end
# find the side view max's and save to an array
  side_max = []
  for i in grid
    side_max.push(i.max)
  end

  total = 0
# find the max height a building can be by comparing the max for that row(i) and position in row(j) with the max's found above. Then subtract the current value and add the difference to the total.
  for i in (0..grid.length-1)
    for j in (0..size-1)
      min = [top_max[j], side_max[i]].min
      total += min - grid[i][j]
    end
  end

  total
end
