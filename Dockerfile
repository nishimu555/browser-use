# ベースイメージとしてNode.jsを使用
FROM node:18

# Pythonをインストールするために必要なパッケージを追加
RUN apt-get update && apt-get install -y python3 python3-pip

# 作業ディレクトリを設定
WORKDIR /usr/src/app

# 必要なファイルをコピー
COPY package*.json ./

# browser-useをインストール
RUN npm install browser-use

# 依存関係をインストール
RUN npm install

# Python用の依存関係をインストール
COPY requirements.txt ./
RUN pip3 install -r requirements.txt

# アプリケーションコードをコピー
COPY . .

# アプリケーションを実行するポートを指定
EXPOSE 3000

# Pythonスクリプトを実行するコマンドを追加
CMD ["python3", "main.py"]