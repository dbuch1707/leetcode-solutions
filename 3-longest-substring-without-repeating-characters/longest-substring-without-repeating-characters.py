class Solution:
    def lengthOfLongestSubstring(self, s: str) -> int:
        char_set = set()   # bag that holds current window characters
        left = 0           # left edge of window
        max_length = 0     # tracks longest we've seen

        for right in range(len(s)):   # move right pointer forward

            # if current char is already in bag = DUPLICATE
            while s[right] in char_set:
                char_set.remove(s[left])  # remove leftmost char
                left += 1                  # shrink window from left

            char_set.add(s[right])         # add new char to bag

            # window size = right - left + 1
            max_length = max(max_length, right - left + 1)

        return max_length 