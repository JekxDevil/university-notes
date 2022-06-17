def ex100(l: list):
    tuples = []
    for i in range(0, len(l), 2):
        tuples.append((l[i], l[i+1]))
    print(f"append -> {tuples}")
    tuples.sort()
    print(f"sorted -> {tuples}")
    result = [tuples[0]]
    k = 0
    for j in range(1, len(tuples)):
        if result[k][1] >= tuples[j][0]:
            a = result[k][0]
            b = result[k][1] if result[k][1] >= tuples[j][1] else tuples[j][1]
            result.pop()
            result.append((a, b))
        else:
            result.append((tuples[j]))
            k += 1

    return result
#//////////////////////////////////////////////////////////////////////////////////////


def ex102(myl, k):
    # remove an element from list in On^2 , now On
    swap = False
    for i in range(len(myl)):
        if myl[i] == k:
            swap = True

        if swap and i < len(myl)-1:
            myl[i] = myl[i+1]
    return myl[:-1]
#//////////////////////////////////////////////////////////////////////////////////////

def insertionsort(l):
    # purposely not in place
    A = l.copy()
    for i in range(len(A)):
        j = i - 1
        while j >= 0 and A[j] > A[j+1]:
            A[j], A[j+1] = A[j+1], A[j]
            j -= 1
    return A
#//////////////////////////////////////////////////////////////////////////////////////


def mergesort(l):
    if len(l) <= 1:
        return l

    middle = len(l) // 2
    left = l[:middle]
    right = l[middle:]
    left = mergesort(left)
    right = mergesort(right)

    i = j = 0
    result = []
    while i < len(left) and j < len(right):
        if left[i] < right[j]:
            result.append(left[i])
            i += 1
        else:
            result.append(right[j])
            j += 1

    while i < len(left):
        result.append(left[i])
        i += 1

    while j < len(right):
        result.append(right[j])
        j += 1

    return result
#//////////////////////////////////////////////////////////////////////////////////////


def binarysearch(myl, k):
    start = 0
    end = len(myl) - 1
    while start <= end:
        middle = (start + end) // 2
        if myl[middle] == k:
            return True
        elif myl[middle] < k:
            start = middle + 1
        else:
            end = middle - 1
    return False
#//////////////////////////////////////////////////////////////////////////////////////


def ex103(myl):
    index = 0
    for i in range(10):
        for j in range(len(myl)):
            if myl[j] % 10 == i:
                myl[index], myl[j] = myl[j], myl[index]
                index += 1

    return myl
#//////////////////////////////////////////////////////////////////////////////////////


def ex114(A):
    minx = A[0][0]
    maxx = A[0][0]
    miny = A[0][1]
    maxy = A[0][1]
    for i in range(len(A)):
        if minx > A[i][0]:
            minx = A[i][0]
        if maxx < A[i][0]:
            maxx = A[i][0]
        if miny > A[i][1]:
            miny = A[i][1]
        if maxy < A[i][1]:
            maxy = A[i][1]

    return (minx, miny), (maxx, maxy)


'''def ex115(A, x):
    mymax = 0
    for i in range(len(A)):
        counter = 0
        for j in range(i, len(A)):
            if (abs(A[i][0] - A[j][0]) <= x and abs(A[i][1] - A[j][1])
                and abs(A[i][0] - A[j][1]) <= x and abs(A[][] - A[]) ):
                counter += 2
        if mymax < counter:
            mymax = counter

    return mymax'''


def ex116(A):
    maxl = A[0]
    for i in range(len(A)):
        if maxl < A[i]:
            maxl = A[i]
    return maxl


def twowaymerge(A, B):
    i = 0
    j = 0
    result = []
    while i < len(A) and j < len(B):
        if A[i] < B[j]:
            result.append(A[i])
            i += 1
        else:
            result.append(B[j])
            j += 1

    while i < len(A):
        result.append(A[i])
        i += 1

    while j < len(B):
        result.append(B[j])
        j += 1
    return result


def threewaymerge(A, B, C):
    ab = twowaymerge(A, B)
    return twowaymerge(ab, C)


def ex117sort(myl):
    if len(myl) <= 2:
        return myl

    pivot = len(myl) // 3
    first = myl[:pivot]
    second = myl[pivot: pivot*2]
    third = myl[pivot*2:]
    first = ex117sort(first)
    second = ex117sort(second)
    third = ex117sort(third)
    return threewaymerge(first, second, third)


def direction_abc(a: list, b: list, c: list):
    d = (b[0] - a[0]) * (c[1] - a[1]) - (b[1] - a[1]) * (c[0] - a[0])
    if d > 0:
        return -1
    elif d == 0:
        return 0
    else:
        return 1


def ex118(points):
    '''
    segments = []
    for i in range(len(points)-1):
        segments.append(((points[i]), (points[i+1])))

    if direction(segments[i][0], segments[i][1])
    add modulus'''
    for i in range(0, len(points) - 1):
        for j in range(0, len(points) - 1):
            if ((direction_abc(points[i], points[i+1], points[j]) == 1
                 and direction_abc(points[i], points[i+1], points[j+1]) == -1)
                    or (direction_abc(points[i], points[i + 1], points[j]) == -1
                        and direction_abc(points[i], points[i + 1], points[j+1]) == 1)):
                return False
    return True


def ex214(myl):
    result = []
    min1 = myl[0]
    for i in range(len(myl)):
        if min > myl[i]:
            min = myl[i]


    return result


class BST:
    class Node:
        def __init__(self, key, parent=None, left=None, right=None):
            self.parent = parent
            self.key = key
            self.left = left
            self.right = right

        def __str__(self):
            return f'{self.key}'

    def __init__(self):
        self.root = None

    def insert_all(self, values):
        for x in values:
            self.insert(x)

    def insert(self, x):
        newnode = BST.Node(x)
        parent = None
        node = self.root
        while node is not None:
            parent = node
            if newnode.key <= node.key:
                node = node.left
            else:
                node = node.right
        newnode.parent = parent
        if parent is None:
            self.root = newnode
        else:
            if newnode.key <= parent.key:
                parent.left = newnode
            else:
                parent.right = newnode

    def delete(self, x):
        parent = x.parent

        # root deletion
        if parent is None:
            self.root = None
            return

        # leaf deletion
        if x.left is None and x.right is None:
            if parent.left == x:
                parent.left = None
            else:
                parent.right = None

        # 2 children deletion - find successor, copy key and delete successor recursively which must have only 1 child
        if x.left is not None and x.right is not None:
            suc = BST.successor(x)
            val = suc.key
            self.delete(suc)
            x.key = val
            return

        # 1 child deletion
        if x.left is not None:
            # only left child
            x.left.parent = parent
            if parent.left == x:
                parent.left = x.left
            else:
                parent.right = x.left
            return
        else:
            # only right child
            x.right.parent = parent
            if parent.left == x:
                parent.left = x.right
            else:
                parent.right = x.right
            return

    def search(self, x):
        node = self.root
        while node is not None:
            if x == node.key:
                return node

            if x < node.key:
                node = node.left
            else:
                node = node.right
        return node

    @staticmethod
    def successor(x):
        if x.right is not None:
            x = x.right
            x = BST.min(x)
            return x
        else:
            it = x.parent
            while not it.left == x and it is not None:
                x = it
                it = x.parent
            return it

    @staticmethod
    def predecessor(x):
        original = x
        if x.left is not None:
            x = x.left
            x = BST.max(x)
            return x
        else:
            it = x.parent
            while not it.right == x and it is not None:
                x = it
                it = x.parent
            return it

    def increasing_walk(self, node=None):
        if node is None:
            node = self.root
            print('[', end='')

        if node.left is not None:
            self.increasing_walk(node.left)

        print(f'{node.key} ', end='')

        if node.right is not None:
            self.increasing_walk(node.right)

        if node == self.root:
            print(']')

    @staticmethod
    def min(node):
        """ O(n), OHM(logn) """
        while node.left is not None:
            node = node.left
        return node if node is not None else None

    @staticmethod
    def max(node):
        """ O(n) , OHM(logn)"""
        while node.right is not None:
            node = node.right
        return node if node is not None else None

    @staticmethod
    def rrotate(node):
        l = node.left
        node.left = l.right
        if l.right is not None:
            l.right.parent = node
        l.right = node
        l.parent = node.parent
        if l.parent is not None:
            if l.parent.left.key == node.key:
                l.parent.left = l
            else:
                l.parent.right = l
        node.parent = l
        return l

    @staticmethod
    def lrotate(node):
        r = node.right
        node.right = r.left
        if r.left is not None:
            r.left.parent = node
        r.left = node
        r.parent = node.parent
        if r.parent is not None:
            if r.parent.left.key == node.key:
                r.parent.left = r
            else:
                r.parent.right = r
        node.parent = r
        return r

    def root_insert(self, key):
        self.root = BST.root_insertion(self.root, key)

    @staticmethod
    def root_insertion(tree, key, parent=None):
        if tree is None:
            node = BST.Node(key, parent)
            if parent is not None:
                if key <= parent.key:
                    parent.left = node
                else:
                    parent.right = node
            return node

        if key <= tree.key:
            tree.left = BST.root_insertion(tree.left, key, tree)
            return BST.rrotate(tree)
        else:
            tree.right = BST.root_insertion(tree.right, key, tree)
            return BST.lrotate(tree)


if __name__ == '__main__':
    '''
    A = [1, 100, 1, 2, 10, 12, 6, 8]
    B = [3, 7, 1, 5, 10, 12, 6, 8]
    C = [7, 62, 5, 57, 12, 39, 5, 8, 16, 48]
    print(f"ex100 = {ex100(A)}")      # [(1, 100)]
    print(f"ex100 = {ex100(B)}")      # [10, 12, 1, 8]
    print(f"ex102 = {ex102(B, 7)}")
    print(f"insertion sort {insertionsort(A)}")
    print(f"insertion sort {insertionsort(B)}")
    print(f"mergesort {mergesort(A)}")
    print(f"mergesort {mergesort(B)}")
    print(f"binarysearch true {binarysearch(mergesort(B), 12)}")
    print(f"binarysearch false {binarysearch(mergesort(B), 11)}")
    print(f"ex103 = {ex103(C)}")
    # ask for 105
    print(f"ex114 = {ex114([(0, 4), (-3, 1), (3, 1), (0, -2)])}")   # (-3, -2) (3, 4)
    #print(f"ex115 = {ex115([(-2, 0), (2, 0), (0, 2), (0, -2)], 4)}")   # 4
    #print(f"ex115 = {ex115([(-2, 0), (2, 0), (0, 2), (0, -2), (10, 10)], 4)}")   # 4
    #print(f"ex115 = {ex115([(-2, 0), (2, 0), (0, 2), (0, -2), (-1, 0), (1, 0), (0, 1), (0, -1), (10, 10)], 4)}")   # 8
    print(f"ex116 = {ex116(A)}")
    print(f"ex117 = {ex117sort(C)}")
    print(f"ex118 = {ex118([(0,0), (0,1), (1,1), (1,0)])}")
    print(f"ex118 = {ex118([(0,0), (0,1), (1,0), (1,1)])}") # n2
    print(f"ex118 = {ex118([(1,0), (1,1), (0,0), (0,1), (5, 3)])}") # n2
    print(f"ex118 = {ex118([(0,0), (0,2), (2,2), (2,0), (1, 0)])}")
    # print(f"michi = {tw_merge_sort(C)}")
    print(f"ex214 = {ex214([3, 6, 5, 1])}")
    mybst = BST()
    mybst.insert_all([12, 5, 2, 9, 4, 18, 15, 19, 13, 17])
    mybst.increasing_walk()
    print(BST.min(mybst.root).key, BST.max(mybst.root).key)
    print(mybst.search(-1), mybst.search(9), mybst.search(2), mybst.search(18))
    print(BST.successor(mybst.root).key, BST.successor(mybst.root.left).key, BST.successor(mybst.root.right).key)
    print(BST.predecessor(mybst.root).key, BST.predecessor(mybst.root.left).key, BST.predecessor(mybst.root.right).key)
    print(BST.successor(mybst.root.right.left.left).key)
    print(BST.predecessor(mybst.root.right.left.left).key)
    mybst.insert(10)
    print('to be deleted', mybst.root.left.key)
    mybst.delete(mybst.root.left)
    mybst.increasing_walk()
    print('to be deleted', BST.min(mybst.root))
    mybst.delete(BST.min(mybst.root))
    mybst.increasing_walk()
    mybst = BST()
    mybst.insert_all([15,4,1,7,5,13,6,10,9])
    mybst.increasing_walk()
    print('delete 4')
    mybst.delete(mybst.root.left)
    mybst.increasing_walk()
    '''
    mybst = BST()
    mybst.insert_all([15, 4, 1, 7, 5, 13, 6, 10, 9])
    mybst.increasing_walk()
    BST.lrotate(mybst.root.left.right)
    mybst.increasing_walk()
    mybst.root_insert(8)
    mybst.increasing_walk()
