class DeliveryCharge < ActiveHash::Base

  # 不要
  # include ActiveHash::Associations
  # has_one :item

  self.data = [
    # {id: 0, charge: '選択してください'},
     {id: 1, charge: '送料込み（出品者負担）'}, {id: 2, charge: '着払い（購入者負担）'}
  ]



  # self.data = [
  #     {id: 0, name: '選択してください'},{id: 1, name: '未定'},{id: 2, name: 'らくらくFURIMA便'},
  #     {id: 3, name: 'ゆうメール'},{id: 4, name: 'レターパック'},{id: 5, name: '普通郵便（定形、定形外）'},
  #     {id: 6, name: 'シロネコヤマト'},{id: 7, name: 'ゆうパック'},{id: 8, name: 'クリックポスト'},
  #     {id: 9, name: 'ゆうパケット'}
  # ]



end