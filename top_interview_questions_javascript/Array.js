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

// console.log(rotate([1,2,3,4,5,6,7], 2))


// *****     CONTAINS DUPLICATES     *****

// horendous runtime only beats 8 %
// const containsDuplicate = nums => {
//   array = []
//   for(let i = 0; i < nums.length; i++){
//     if(array.includes(nums[i])){
//       return true
//     } else {
//       array.push(nums[i])
//     }
//   };
//   return false
// };

// improved runtime beats 70%
// const containsDuplicate = nums => {
//   counter = {}
//   for(let i = 0; i < nums.length; i++){
//     if(counter[nums[i]]){
//       return true
//     } else {
//       counter[nums[i]] = 1
//     }
//   };
//   return false
// };

// beats 100% ... for now
const containsDuplicate = nums => {
    let mySet = new Set(nums);
    return mySet.size === nums.length ? false: true
};
// console.log(containsDuplicate([1,2,3,4,5,6]))

// *****     SINGLE NUMBER     *****
// good runtime, poor memory
const singleNumber = nums => {
  obj = {}
  for(let i = 0; i < nums.length; i++){
    obj[nums[i]] ? obj[nums[i]]++ : obj[nums[i]] = 1
    }

  for([num, count] of Object.entries(obj)){
    if(count === 1) return num
  }
};

// console.log(singleNumber([1,1,2,2,3]))

// *****     INTERSECTION OF TWO ARRAYS     *****
// beats 99% for runtime and 65% for memory
const intersect = (nums1, nums2) => {
  const hash = {}; const answer = []

  nums1.forEach(num => {
    hash[num] ? hash[num] ++ : hash[num] = 1
  })

  nums2.forEach(num => {
    if (hash[num] && hash[num] > 0){
      answer.push(num)
      hash[num]--
    }
  })
  return answer
};

// console.log(intersect([1,2,2,1], [2,2]))


// *****     PLUS ONE     *****
// beats 95% for runtime and almost all for memory(no % given)
const plusOne = (arr, count = 1) => {
  let pos = arr.length - count
  if(arr[pos] !== 9){
    arr[pos]++
  } else {
    arr[pos] = 0
    if(count === arr.length){
      arr.unshift(0)
    }
    count ++
     plusOne(arr, count)
  }
  return arr
}

// console.log(plusOne([9,9,9]))

// *****     MOVE ZEROES     *****
const moveZeroes = (nums) => {
  for(let i = 0; i < nums.length; i++){
    if(nums[i] === 0){
      nums.push( nums.splice(nums.indexOf(nums[i]),1)[0])
    }
  }
  return nums
}

console.log(moveZeroes([1,2,0,2,0,8,7]))
//
