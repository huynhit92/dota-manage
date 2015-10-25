GLOBAL_SAVE_MSG = '登録が正常に完了しました。'
GLOBAL_UPDATE_MSG = '更新が正常に完了しました。'
GLOBAL_UPDATE_ERROR_MSG = '更新中にエラーが発生しました。入力情報を見直してください。'
GLOBAL_CONFLICT_MSG = '他のユーザーが更新中です。時間を置いてもう一度操作を行なって下さい。'

MASTERS = {
  :messages => {
    "入力してください" => :fill_in_error,
    "更新しました" => :save_success
  },
  :hero_types => Hero::TYPE_MASTERS,
  :item_types => Item::TYPE_MASTERS,
  :hero_positions => Hero::POSITION_MASTERS,
  :grown_level_masters => GrownLevelMaster::MASTERS,
  :divide_masters => Divide::MASTERS
}
