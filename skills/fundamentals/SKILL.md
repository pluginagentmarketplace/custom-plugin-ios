---
name: fundamentals
description: Foundational computer science skills including data structures, algorithms, complexity analysis, Git version control, Linux system administration, and shell scripting.
---

# Fundamentals

Master the core skills that enable all software development specializations.

## Data Structures Fundamentals

### Arrays & Lists
```python
# Dynamic array/list
arr = [1, 2, 3, 4, 5]
arr.append(6)        # O(1) amortized
arr.insert(0, 0)     # O(n)
arr.pop()            # O(1)
arr.pop(0)           # O(n)
```

### Linked Lists
```python
class Node:
    def __init__(self, val):
        self.val = val
        self.next = None

# Advantages: O(1) insertion/deletion at head
# Disadvantages: O(n) random access
```

### Hash Tables
```python
# Python dictionary
mapping = {}
mapping['key'] = 'value'     # O(1) average
value = mapping.get('key')   # O(1) average
del mapping['key']           # O(1) average
```

### Trees
```python
class TreeNode:
    def __init__(self, val):
        self.val = val
        self.left = None
        self.right = None

# Binary Search Tree: O(log n) search, insert, delete
# Balanced tree (AVL, Red-Black): Guaranteed O(log n)
# Unbalanced tree: Degrade to O(n)
```

### Graphs
```python
# Adjacency list representation (efficient)
graph = {
    'A': ['B', 'C'],
    'B': ['A', 'D'],
    'C': ['A', 'D'],
    'D': ['B', 'C']
}

# BFS: Find shortest path
# DFS: Explore all paths
```

## Algorithm Complexity (Big O)

| Notation | Name | Example |
|----------|------|---------|
| **O(1)** | Constant | Hash table lookup |
| **O(log n)** | Logarithmic | Binary search |
| **O(n)** | Linear | Simple loop |
| **O(n log n)** | Linearithmic | Efficient sorts |
| **O(n²)** | Quadratic | Nested loops |
| **O(2ⁿ)** | Exponential | Recursion without memo |
| **O(n!)** | Factorial | Permutations |

### Big O Analysis
```python
# O(n) - single loop
for i in range(n):
    print(i)

# O(n²) - nested loops
for i in range(n):
    for j in range(n):
        print(i, j)

# O(log n) - divide and conquer
def binary_search(arr, target):
    left, right = 0, len(arr) - 1
    while left <= right:
        mid = (left + right) // 2
        if arr[mid] == target:
            return mid
        elif arr[mid] < target:
            left = mid + 1
        else:
            right = mid - 1
    return -1
```

## Git Mastery

### Essential Commands
```bash
# Setup
git config --global user.name "Your Name"
git config --global user.email "your@email.com"

# Daily workflow
git clone <url>          # Clone repo
git add .                # Stage changes
git commit -m "message"  # Commit changes
git push origin branch   # Push to remote
git pull origin main     # Get latest changes

# Branching
git branch feature       # Create branch
git checkout -b feature  # Create & switch
git switch feature       # Switch branch
git merge main           # Merge into current branch

# Undoing changes
git restore .            # Discard unstaged changes
git restore --staged .   # Unstage changes
git reset HEAD~1         # Undo last commit (keep changes)
git revert <commit>      # Create new commit that undoes changes
```

### Advanced Git
```bash
# Rebase (rewrite history - use with caution!)
git rebase main          # Replay commits on top of main

# Cherry-pick specific commit
git cherry-pick <commit>

# Stash temporary changes
git stash                # Save changes
git stash pop            # Restore changes

# See all commits
git log --graph --oneline --decorate --all
```

## Linux System Administration

### File Permissions
```bash
# Permission format: rwxrwxrwx (user, group, other)
# r=4, w=2, x=1

chmod 755 script.sh      # rwxr-xr-x
chmod 644 file.txt       # rw-r--r--
chmod 700 private_dir    # rwx------

# Change ownership
chown user:group file
```

### Process Management
```bash
ps aux                   # List all processes
kill -9 <pid>           # Force kill process
top                      # Monitor processes
bg / fg                  # Background/foreground jobs
nohup command &         # Run immune to hangups
```

### System Monitoring
```bash
df -h                    # Disk usage
du -sh <dir>            # Directory size
free -h                  # Memory usage
vmstat                   # Virtual memory
iostat                   # I/O statistics
```

## Shell Scripting Basics

### Variables and Operations
```bash
#!/bin/bash

# Variables
name="John"
age=30
echo "Hello, $name. You are $age years old."

# Arithmetic
result=$((5 + 3))       # result = 8
result=$((5 * 3))       # result = 15
result=$((5 / 3))       # result = 1
```

### Conditionals
```bash
# If statement
if [ $age -gt 18 ]; then
    echo "Adult"
elif [ $age -eq 18 ]; then
    echo "Just became adult"
else
    echo "Minor"
fi

# Test operators
[ -f file.txt ]         # File exists
[ -d directory ]        # Directory exists
[ "$str1" = "$str2" ]   # String equality
[ $num1 -gt $num2 ]     # Greater than
```

### Loops
```bash
# For loop
for i in 1 2 3 4 5; do
    echo $i
done

# While loop
while [ $counter -lt 10 ]; do
    echo $counter
    ((counter++))
done

# Loop through files
for file in *.txt; do
    echo "Processing $file"
done
```

### Functions
```bash
# Function definition
function greet() {
    local name=$1    # Local variable
    echo "Hello, $name"
}

# Call function
greet "Alice"
```

## Design Patterns

### Singleton
```python
class Singleton:
    _instance = None

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super().__new__(cls)
        return cls._instance
```

### Factory
```python
class AnimalFactory:
    @staticmethod
    def create_animal(animal_type):
        if animal_type == "dog":
            return Dog()
        elif animal_type == "cat":
            return Cat()
```

### Observer
```python
class Subject:
    def __init__(self):
        self._observers = []

    def attach(self, observer):
        self._observers.append(observer)

    def notify(self):
        for observer in self._observers:
            observer.update()
```

## Interview Preparation

### Common Questions
1. **Explain Big O notation** - Describe time/space complexity
2. **Reverse a linked list** - Classic interview question
3. **Find duplicate in array** - Multiple approaches
4. **Implement LRU cache** - Design question
5. **Merge sorted arrays** - Merge sort basis
6. **Binary tree level order** - Tree traversal

### Practice Platforms
- LeetCode - Thousands of coding problems
- HackerRank - Structured learning paths
- CodeSignal - Interview-style challenges
- Pramp - Live pair programming interviews

---

**Fundamentals are permanent. Master them and everything else becomes easier!**
