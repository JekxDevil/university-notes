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
        if min > myl[i]
            min = myl[i]


    return result


if __name__ == '__main__':
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
