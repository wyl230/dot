import os

search_key = input('输入关键词，空格分隔:\n').split()
print(search_key)
# exit(0)
# 遍历文件夹
def walkFile(file):
    for root, dirs, files in os.walk(file):
        # root 表示当前正在访问的文件夹路径
        # dirs 表示该文件夹下的子目录名list
        # files 表示该文件夹下的文件list

        # 遍历文件
        for f in files:
            # if(f.find('js') != -1):
            file = os.path.join(root, f)

            with open(file) as f:
                try:
                    cnt = 0
                    for l in f.readlines():
                        if len(l) > 1000:
                            continue
                        for key in search_key:
                            if l.find(key) != -1:
                                print(file, cnt + 1, l)
                                break
                        cnt += 1
                except:
                    print(file, 'failed')
        # 遍历所有的文件夹
        for d in dirs:
            pass
            # os.path.join(root, d)
            # print(os.path.join(root, d))

def main():
    walkFile(".")

if __name__ == '__main__':
    main()
