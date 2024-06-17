#!/bin/bash

# 定义函数以递归地清理文件夹中的文件
clean_encrypt_files() {
    local folder_path=$1
    local files=()

    # 遍历文件夹中的文件和子文件夹
    while IFS= read -r -d '' file; do
   #清理encrypt结尾的文件
        if [[ $file == *.encrypt ]]; then
            # 删除文件
            rm "$file"
            echo "Deleted file: $file"
        fi
    done < <(find "$folder_path" -type f -name "*.encrypt" -print0)
}

# 指定要清理的文件夹路径
folder_path="Z:\"

# 调用函数进行清理
clean_encrypt_files "$folder_path"