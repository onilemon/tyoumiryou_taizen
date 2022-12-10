# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(
   #email: 'a@a',
   #password: '123456'
#)

# users_data = [
#   ["ポチ", "a@a", "20", "男性"],
#   ["ミケ", "s@s", "25", "女性"],
#   ["dsfv", "a@asdf", "33", "男性"],
#   ["クロ", "q@q", "35", "秘密"]
# ]

Item.create!(
  [
    {
      name: "あごだししょうゆ",
      introduction: "うすくちしょうゆをベースに、国産100％の焼きあごだしと、豊かなうまみで深いコクのある独自の「発酵だし」を合わせました。上品な味わいでほのかな甘みのあるうす色のだししょうゆです。淡い色合いなので、炊き込みごはん・卵焼き・浅漬けなどの調理メニューを、素材の色を活かしながら風味良く仕上げます。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/あごだししょうゆ.jpg"), filename: "あごだししょうゆ"),
      genre_id: 4
    },
    {
      name: "イタリアンロックソルト",
      introduction: "イタリア・シシリー島の山脈から採掘した粗い粒の岩塩です。 約5億～200万年という長い年月をかけ自然の力で結晶化された岩塩は、大変純度が高くミネラルが豊富に含まれ、旨味がたっぷりです。料理の味を存分にひきたてます。 ロック状になっているので、そのまま岩塩料理に。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/イタリアンロックソルト.jpg"), filename: "イタリアンロックソルト"),
      genre_id: 1
    },
    {
      name: "お米のシロップ",
      introduction: "「お米のシロップ」は、お米に含まれるでんぷんを、麦芽に含まれる酵素の力によって糖化させた穀物由来の甘味料です。オリゴ糖が含まれており、腸内に存在するビフィズス菌などの善玉菌のエサとなり、便秘解消を初めとする様々な健康効果をもたらすと言われています。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/お米のシロップ.jpg"), filename: "お米のシロップ"),
      genre_id: 2
    },
    {
      name: "きび酢",
      introduction: "さとうきび100%のきび酢は、健康に気を使っている人におすすめ。人工的な甘さがないため、そのまま飲んでも料理に入れても使えます。料理にかけたりドレッシングに使用したり、活用方法も豊富なのが美点。原材料がシンプルなさとうきび100%は、手軽に栄養素を摂取できます。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/きび酢.jpg"), filename: "きび酢"),
      genre_id: 3
    },
    {
      name: "相撲味噌",
      introduction: "辛さの後に旨みが広がる!にんにくと唐辛子をたっぷり入れた濃厚旨辛みそたれです。焼肉や炒め物の調味料に、生の野菜にもぴったり!",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/相撲味噌.jpg"), filename: "相撲味噌"),
      genre_id: 5
    },
    {
      name: "ピエトロ ドレッシング 和風しょうゆ",
      introduction: "創業当時からの定番ドレッシング！ ピエトロの定番ドレッシング。たまねぎの旨みとしょうゆの風味がいきています。 野菜嫌いなお子様もこのドレッシングをかけると野菜が大好きになるという不思議なドレッシングです。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/ピエトロ和風しょうゆ.jpg"), filename: "ピエトロ ドレッシング 和風しょうゆ"),
      genre_id: 6
    },
    {
      name: "オタフクお好みソース",
      introduction: "たっぷりの野菜、果実に約20種類の香辛料をブレンド。 こだわり原料「デーツ」の、コクのある甘さが特徴のまろやかなソースです。 お好み焼屋さんと共に試行錯誤を重ねて出来上がった、磨かれ続ける「プロの味」です。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/オタフクお好みソース.jpg"), filename: "オタフクお好みソース"),
      genre_id: 7
    },
    {
      name: "黄金一味",
      introduction: "とにかく辛く日本一辛いというネーミングにふさわしい祇園味幸の黄金一味。鷹の爪（赤唐辛子）の10倍の辛味成分を持つ日本一辛い黄金唐辛子を仕様しているので瓶の中は黄色い粉が詰まっているように見えます。辛いのが好きな方におすすめです。辛味のキレがよく、癖がないので、うどんや蕎麦、丼もの等どんな料理にもよく合います。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/黄金一味.jpg"), filename: "黄金一味"),
      genre_id: 8
    },
    {
      name: "ほりにし",
      introduction: "20種類以上のスパイスや調味料をスペシャルブレンド、肉はもちろん野菜や魚等どんな食材にもマッチングするオールマイティスパイスです。 塩や醤油など和風テイストで調和のとれたスパイスの中に風味豊かなガーリックがアクセント。さらにフランス料理などでも使われるミルポアパウダーがより一層、素材の旨味を引き出します。",
      image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/public/images/ほりにし.jpg"), filename: "ほりにし"),
      genre_id: 9
    }
  ]
)

# users_attributes = users_data.map do |data|
#   { nickname: data[0],
#     email: data[1],
#     password: "password",
#     birthday: data[2],
#     sex: data[3]}
# end

# users_attributes.each do |attr|
#   User.create!(attr)
# end


#genres = ["塩", "甘味", "酢", "醤油", "味噌", "ドレッシング", "ソース", "辛味", "スパイス"]

#genres.each{ |genre| Genre.create!(name: genre) }
