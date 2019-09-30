# schedule_management_app

## データベーステーブル
・taskテーブル
  ・id
  ・task_name （タスク名） string
  ・end_time （終了時間）  datetime
  ・priority （優先順位）  integer
  ・status （ステータス）　string
  ・memo （タスクの説明）  text

・labelテーブル
  ・id
  ・label_color   string

・userテーブル
  ・id
  ・user_id      string
  ・password     string

