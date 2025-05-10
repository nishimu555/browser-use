import json
from browser_use import Browser

def load_config():
    """設定ファイルを読み込む"""
    with open("config.json", "r") as file:
        return json.load(file)

def main():
    # 設定を読み込む
    config = load_config()

    # Browserインスタンスを作成
    browser = Browser(
        browser=config["browser"],
        headless=config["headless"],
        timeout=config["timeout"]
    )

    # 指定されたURLを開く
    browser.open(config["start_url"])

    # ページタイトルを取得して表示
    print("Page Title:", browser.get_title())

    # ブラウザを閉じる
    browser.close()

if __name__ == "__main__":
    main()