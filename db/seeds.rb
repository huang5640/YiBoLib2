# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Book.destroy_all
User.destroy_all

User.create!([
	{ YiBoID: "11111111", name: "Jax", GovID: "401213789123", address: "1075 Space Park Way, Mountain View, CA", AuthNum: 3, password_digest: User.digest("huangjiajun")},
	{ YiBoID: "22222222", name: "Baby", GovID: "412378124891", address: "973 Dolors Ave, Los Altos, CA", AuthNum: 2, password_digest: User.digest("yubingting")},
	{ YiBoID: "33333333", name: "Vincent", GovID: "1238973928111", address: "white house, WA", AuthNum: 5, password_digest: User.digest("hahahaha")}])

10.times do |n|
  name = Faker::Name.name
  yiboid = Faker::Number.number(8)
  govid = Faker::Number.number(11)
  add = Faker::Address.street_address
  authnum = Faker::Number.number(1)
  pw = 'password'

  User.create!(name: name, YiBoID: yiboid, GovID: govid, address: add, AuthNum: authnum, password_digest: User.digest(pw))

end

p "Created #{User.count} users"

Book.create!([
	{ title: "丈量世界", author: "[德] 丹尼尔‧凯曼", description: "★好奇心比雄心走得更远
★2006年欧洲第一畅销书，超越《哈利• 波特》和《达• 芬奇密码》
★德国20年来最畅销的小说 连续37周《明镜周刊》图书榜冠军
★德国中学指定读物
我们毕生追求的事业到最后都会衰退、会消亡。只有一样是真的，那就是追求知识的乐趣，它值得我们为它献身。像《丈量世界》里的洪堡和高斯。——梁文道《开卷八分钟》
我们今天的教育方式，是努力把关于这个世界已知的知识，恨不得一股脑填进孩子的脑袋。如果仅仅以这个为教育目的，人在只是记忆和计算速度上连一部手机都比不上。人最大的价值是对未知世界的探索。
读这本书，就是参与一个用事实和虚构精心设计的游戏，结局并不重要，乐趣在每一处关卡，每一次缠斗。
——罗辑思维 罗振宇
------------------------------------------------------------------------------------------
洪堡，哥伦布之后最伟大的博物学家、地理学家。
高斯，牛顿以来最伟大的数学天才。
这两位同处一个时代的德国科学家，以截然相反的方式进行各自的研究，最后却走向奇迹般一致的远大目标：丈量世界！", ISBN: "9787544276597", image: "https://img2.doubanio.com/mpic/s28295328.jpg"},
	{ title: "非凡小人物", author: "[英] 艾瑞克.霍布斯鲍姆", description: "无与伦比。
《观察家报》
非常睿智……因为他熔知识与观点于一炉，跨越重重国度、数个世纪，其蕴含的能量罕有其匹。
《苏格兰人报》
我们这个时代最杰出的历史学家。
《星期日独立报》
开创史学研究新领域、国际知名史学大师──霍布斯鲍姆，以小人物的 故事演义左派历史的非凡著作
“这本书所谈论的几乎都是那些默默无闻的人物，除了他们的家人和街坊邻居以外，他们的名字不被人知晓，即使是在现代国家，那些登记出生、结婚、死亡的政府机关也没有他们的资料……在现在这样一个媒体时代，音乐与运动让少数人得以获取个人的声望，若是在较早的年代，这些人可能会一辈子默默无闻。这些人占了人类的绝大多数，历史学家之间的争辩不会论及这群人……我这一本书的要点在于，应该将这类人物从被遗忘的状态中拯救出来，让他们免于遭受‘后代子孙不屑一顾’的命运。……”
──艾瑞克•霍布斯鲍姆
劳工、农民、杂货商、公交车收票员、调酒师、盗匪、黑手党……，享誉国际的史学大师这回关心的是一些社会上默默无闻的小人物，他探讨鞋匠在欧洲政治中的角色、他思索反对采用新机器的工人对劳工运动的影响、他谈论被视为劳工语言的爵士乐的兴衰更迭……
", ISBN: "9787509776704", image: "https://img1.doubanio.com/mpic/s28296554.jpg"},
	{ title: "舍得，舍不得", author: "蒋勋", description: "京都永观堂、清迈无梦寺、加拿大奈恩瀑布……蒋勋带着《金刚经》，读经、抄经，旅行十方，在心的寺院里一殿一殿地拜去，在洪荒自然里看见生命的不同修行，在文学艺术里照见生命的不同可能，与一切有情众生，领会人生中的舍得与难舍……", ISBN: "9787535673800", image: "https://img3.doubanio.com/mpic/s28314790.jpg"}])
p "Created #{Book.count} books"
