// *****     REMOVE DUPLICATES FROM SORTED ARRAY     *****

var removeDuplicates = function(nums) {
  let i = 0
  let j = 1

  while(j < nums.length){
    if(nums[i] != nums[j]){
      i++
      nums[i] = nums[j]
      j++
    } else {
      j ++
    }
  }
nums.splice(i +1)
};

// removeDuplicates([1,1,2,2,2,2,3])


// *****     BEST TIME TO BUY AND SELL STOCK II     *****

var maxProfit = function(prices) {
  let profit = 0
  let i = 0
  let j = 1
  while(j < prices.length){
    if (prices[j] > prices[i]){
      profit += prices[j] - prices[i]
    }
    i++
    j++
  }
  return profit
};

                  // OPTION USING REDUCE INSTEAD
// array.reduce( function(total, currentValue, currentIndex, arr), initialValue )
// var maxProfit = function(prices) {
//   return prices.reduce((profit, price, i, prices) =>
//     price > prices[i -1] ? profit + price - prices[i-1] : profit, 0)
// }


// *****     ROTATE ARRAY     *****

// option 1, average runtime and memory
var rotate = function(nums, k) {
  for(let i = 0; i < k; i++){
    nums.unshift(nums.pop())
  };
};

// option 2, leetcode does not recognise flat as a function
var rotate = function(nums, k) {
nums.unshift(nums.splice(nums.length-k))
  return nums.flat()
};

console.log(rotate([1,2,3,4,5,6,7], 2))




//
