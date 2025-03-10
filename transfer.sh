#!/bin/bash

# Tên repo GitHub
REPO_URL="https://github.com/dante4rt/evm-auto-transfer.git"
FOLDER_NAME="evm-auto-transfer"

# Clone repo
echo "🚀 Cloning repository..."
git clone $REPO_URL

# Di chuyển vào thư mục dự án
cd $FOLDER_NAME || exit

# Cài đặt dependencies
echo "📦 Installing dependencies..."
npm install

# Kiểm tra nếu privateKeys.json đã tồn tại
if [ ! -f "privateKeys.json" ]; then
    echo "🔑 Nhập Private Key của bạn (không có 0x):"
    read -s PRIVATE_KEY

    # Kiểm tra độ dài Private Key
    if [ ${#PRIVATE_KEY} -ne 64 ]; then
        echo "❌ Private Key không hợp lệ! Phải có đúng 64 ký tự hex."
        exit 1
    fi

    # Ghi vào file privateKeys.json
    echo "[\"0x$PRIVATE_KEY\"]" > privateKeys.json
    echo "✅ Đã tạo privateKeys.json thành công!"
else
    echo "✅ privateKeys.json đã tồn tại."
fi

# Chạy bot
echo "🚀 Đang khởi chạy bot..."
npm start
