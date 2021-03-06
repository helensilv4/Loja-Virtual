create database loja_games
default character set utf8
default collate utf8_general_ci;

use loja_games;

create table tbl_categoria_produto
(
	cod_categoria_produto int primary key auto_increment,
    descricao_categoria_produto varchar(25) not null    
)
default charset utf8;

create table tbl_desenvolvedor
(	
    cod_desenvolvedor int primary key auto_increment,
    nome_desenvolvedor varchar(45) not null    
)
default charset utf8;

create table tbl_fornecedor
(	
    cod_fornecedor int primary key auto_increment,
    nome_fornecedor varchar(45) not null    
)
default charset utf8;

create table tbl_usuario
(
	cod_usuario int primary key auto_increment,
    nome_usuario varchar(80) not null,
    descricao_email varchar(80) not null,
    descricao_senha varchar(6) not null,
    descricao_status boolean not null,
    descricao_endereco varchar(80) not null,
    descricao_cidade varchar(30) not null,
    num_cep char(9) not null
)
default charset utf8;

create table tbl_produto
(
	cod_produto int primary key auto_increment,
    cod_categoria_produto int not null,
    nome_produto varchar(100) not null,
    cod_desenvolvedor int not null,
    cod_fornecedor int not null,
    valor_preco decimal(10,3) not null,
    qtd_estoque int not null,
    descricao_produto text not null,
    descricao_capa text not null,
    sg_lancamento enum('S','N') not null,
    constraint fk_categoria_produto foreign key(cod_categoria_produto) references tbl_categoria_produto(cod_categoria_produto),
	constraint fk_desenvolvedor_produto foreign key(cod_desenvolvedor) references tbl_desenvolvedor(cod_desenvolvedor),
    constraint fk_fornecedor_produto foreign key(cod_fornecedor) references tbl_fornecedor(cod_fornecedor)
)
default charset utf8;

create table tbl_venda
(
	cod_venda int(11) primary key auto_increment,
    numero_ticket varchar(13) not null,
    cod_cliente int(11) not null,
    cod_produto int(11) not null,
    qtd_produto int(11) not null,
    valor_item int(11) not null,
    valor_total_item decimal (10,2) generated always as ((qtd_produto * valor_item)) virtual,
    data_venda date not null
)
default charset utf8;

create table tbl_form
(
    cod_form int primary key auto_increment,
    nome_usuario_form varchar(80) not null,
    descricao_email_form varchar(80) not null,
    descricao_form text not null
)
default charset utf8;

insert into tbl_categoria_produto 
values(default,'A????o'),    				 	-- 1
(default, 'Aventura'),     	 				-- 2
(default, 'Estrat??gia'),					-- 3
(default, 'Esporte'),						-- 4
(default, 'Corrida'),						-- 5
(default, 'Simula????o'),						-- 6
(default, 'Batalha'),						-- 7
(default, 'RPG'),							-- 8
(default, 'FPS'),							-- 9
(default, 'MMO'),							-- 10
(default, 'Xbox'),							-- 11
(default, 'Playstation'),					-- 12
(default, 'Nintendo'),						-- 13
(default, 'Munitor Gamer'), 				-- 14
(default, 'Controles'),						-- 15
(default, 'Headset'),						-- 16
(default, 'Fones de ouvido'),				-- 17
(default, 'Controle de m??dia'), 			-- 18
(default, 'Teclado/Mouse'),					-- 19
(default, 'Cabo USB/HDMI/Carregador'),		-- 20
(default, 'Cabo de for??a');					-- 21

insert into tbl_desenvolvedor
values(default,'Rockstar Games'),					-- codigo 1
(default, 'Guerrilla Games'),						-- codigo 2	
(default, 'Kojima Productions'),					-- codigo 3
(default, 'Insomniac Games'),						-- codigo 4
(default, 'Santa Monica Studio'),					-- codigo 5
(default, 'Ubisoft Montreal'),						-- codigo 6
(default, 'Naughty Dog'),							-- codigo 7
(default, 'Crystal Dynamics e Eidos Montr??al'),		-- codigo 8
(default, 'Firaxis Games'),							-- codigo 9
(default, 'Paradox Development Studio'),			-- codigo 10
(default, 'Polyphony Digital??'),					-- codigo 11
(default, 'Electonic Arts'),						-- codigo 12
(default, '11 bit studio'),							-- codigo 13
(default, 'Playstation'),				    		-- codigo 14
(default, 'Microsoft'),								-- codigo 15
(default, 'Visual Concepts'),                       -- codigo 16
(default, 'EA Gothenburg'),                         -- codigo 17
(default, 'Codemasters'),                           -- codigo 18
(default, 'Criterion Games'),                       -- codigo 19
(default, 'Team Fractal Alligator'),                -- codigo 20
(default, 'Maxis'),                                 -- codigo 21
(default, 'Ubisoft'),                               -- codigo 22
(default, 'Dice'),                                  -- codigo 23
(default, 'CD Projekt'),                            -- codigo 24
(default, 'Iron Galaxy'),                           -- codigo 25
(default, 'Bethesda Game Studios'),                 -- codigo 26
(default, 'Valve Corporation'),                     -- codigo 27
(default, 'Blizzard Entertainment'),                -- codigo 28
(default, 'CyberConnect2'),                         -- codigo 29
(default, 'ZeniMax Online Studios'),                -- codigo 30
(default, 'Panic Button Games'), 					-- codigo 31
(default, 'Xbox'),                                  -- codigo 32
(default, 'Nintendo');                              -- codigo 33

insert into tbl_fornecedor
values(default,'Rockstar Games'),
(default, 'Sony Interactive Entertainment'),
(default, 'Square Enix'),
(default, 'SND'),
(default, 'MH Games'),
(default, 'Comp Distribuidora'),
(default, 'Mais Eletr??nicos'),
(default, 'Nave Atacado'),
(default, 'MGSP Group'),
(default, 'Netshop Games'),
(default, 'Origin'),
(default, 'Ubisoft'),
(default, 'Blizzard Entertainment'),
(default, 'Blue Waves Games'),
(default, 'Playstation'),				    		
(default, 'Microsoft'),	
(default, 'Xbox'),
(default, 'Nintendo');

insert into tbl_usuario 
values(default, 'Jos?? Cleitinho','josecleitinho@gmail.com','123456','1','Rua Adamastor, 58','Santos','05252-020'),
(default, 'Bruna Pianco','bruna@gmail.com','654321','1','Rua Professor At??lio Innocenti, 65','S??o Paulo','77431-735'),
(default, 'Guilherme Gomes','guigomes@gmail.com','481256','0','Rua Ov??dio Jos?? Ant??nio Santana, 73','S??o Paulo','72941-308'),
(default, 'Guilherme Vieira','guivieira@gmail.com','973520','0','Rua Ana Velha, 593','S??o Paulo','62616-739'),
(default, 'Helen Silva','helen@gmail.com','984812','1','Rua Joaquim Gon??alves da Silva, 87','S??o Paulo','68962-091'),
(default, 'Marcelo Henrique','marcelo@gmail.com','352069','1','Rua Abel Seixas, 98','S??o Paulo','89157-155');

-- Primeira parte 
insert into tbl_produto
values 
(Default,'1', '<p>Red Dead Redemption 2 - Assuma sua Posi????o no Velho Oeste</p>',
'1','1','133.75','25', '<p>O famoso "GTA do velho oeste" est?? de volta, trazendo consigo o retorno de um mundo aberto 
povoado por cowboys.Com o fim dessa ??poca chegando, gangues s??o perseguidas pelas autoridades e voc?? se encontra 
bem em meio ao confronto.</p>','reddead.png','N'),
 
(Default,'1', '<p>Horizon Zero Dawn - O Futuro ?? Seu e das M??quinas</p>',
'2','2','59.99','85','<p>Esteja preparado para encarar um futuro dominado por m??quinas em Horizon Zero Dawn. 
Como a jovem Aloy, voc?? dever?? sobreviver em uma terra selvagem onde perigosos rob??s aguardam para lhe atacar.
 Misturando elementos de fantasia com fic????o cient??fica, este jogo ??nico proporcionar?? horas de aventura.</p>','horizonzero.png','N'),

(Default,'1','<p>Death Stranding - O Amanh?? Est?? em Suas M??os</p>','3','2','145.99','23',
'<p>Esta incr??vel obra, fruto da imagina????o do aclamado criador da s??rie de jogos Metal Gear Solid, busca lhe conectar 
n??o apenas a gr??ficos deslumbrantes, mas tamb??m a personagens interpretados por um tremendo 
elenco de atores hollywoodianos.</p>','deathstranding.png','N'),
 
(Default,'1','<p>Marvel???s Spider-Man Torne-se o Her??i da Cidade que Nunca Dorme</p>','1','4','125.99','80',
'<p>Marvels Spider-Man ?? o jogo definitivo para f??s de super-her??is, especialmente do famoso escalador de paredes origin??rio 
dos quadrinhos. Jogadores assumir??o o papel do jovem her??i e dever??o enfrentar desafios para equilibrar a vida normal de 
Peter Parker com a extraordin??ria do Homem - Aranha.</p>','marvelspider.png','N');

-- Segunda parte 
insert into tbl_produto
values
(Default,'2','<p>Assassin???s Creed IV - Assassino em Solo</p>','6','1','56.99','60',
'<p>Lan??ado em 2013, Assassin???s Creed IV: Black Flag chegou mais tarde ao PS4 com gr??ficos aprimorados e a mesma aventura 
empolgante. Apesar de dar continuidade a hist??ria da Cren??a dos Assassinos, o game funciona muito bem sozinho por 
trazer uma nova mec??nica de navega????o. Sim, ?? poss??vel passar horas controlando navios e realizando saques!</p>','creediv.png','N'),

(Default,'2','<p>Uncharted 4: A Thief???s End</p>','7','2','56.90','50',
'<p>Claramente inspirada em Tomb Raider, a franquia Uncharted tamb??m encerra o legado do protagonista principal 
com ainda mais aventura. Em Uncharted 4: A Thief???s End, Nathan Drake e seu irm??o saem em busca de um tesouro 
que mudar?? suas vidas para sempre. No entanto, essa busca atrai inimigos que estar??o presentes ao longo de 
todo o percurso.</p>','uncharted.png','S'),

(Default,'2','<p>Shadow of The Tomb Raider - O Cap??tulo Mais Sombrio</p>','8','3','102.99','90',
'<p>Dando um fim ?? mais recente trilogia de jogos da Lara Croft, Shadow of The Tomb Raider traz de volta o que h?? de melhor nos jogos 
anteriores e leva a hero??na para lugares ex??ticos repletos de tumbas para explorar e mist??rios a serem descobertos. ?? o jogo perfeito
para quem curte arqueologia, aventura e a????o.</p>','shadow.png','S'),

(Default,'2','<p>God of War - O Renascimento de uma Lenda</p>','5','2','62.89','32',
'<p>Quando o assunto ?? executar tudo com maestria, o jogo do ano de 2018, God of War, ?? o exemplo 
mais recente. N??o s?? o game tinha a obriga????o de honrar todo o legado de Kratos, o deus da guerra, 
como tamb??m teve de dar um novo prop??sito para o her??i, que agora ?? pai e precisa ensinar e esconder 
todo o seu passado do pr??prio filho.</p>','godofwar.png','S');

-- Tercira parte
insert into tbl_produto
values
(Default,'3','<p>XCOM 2</p>','9','6','132.12','70', '<p>Os Alien??genas dominaram o planeta e voc?? lidera 
a for??a de combate feita para combater os invasores em??XCOM 2. Melhore seus soldados, seus equipamentos 
e mantenha todos os guerreiros vivos durante essa hist??ria??? se puder.</p>','xcom2.png','S'),

(Default,'3','<p>Europa Universalis 4</p>','10','9','69.99','40','<p>Crie, expanda e consolide o 
seu imp??rio atrav??s dos s??culos em??Europa Universalis 4. Com detalhes hist??ricos realmente precisos e uma 
liberdade de jogo incr??vel, ?? um ??timo simulador de estrat??gias diplom??ticas e de domin??ncia para todos 
os fans de jogos de estrat??gia.</p>','europauniversalis.png','N'),

(Default,'3','<p>Frostpunk</p>','13','8','182.99','40','<p>Voc?? ?? o l??der da ??ltima civiliza????o humana do mundo. 
Diferente de outros jogos de estrat??gia, Frostpunk te coloca contra um inimigo implac??vel, o mundo. Voc?? precisa 
sobreviver ao frio e ??s condi????es extremas, a verdadeira pergunta aqui ??, quanto tempo voc?? consegue aguentar?</p>','frostpunk.png','S'),

(Default,'4','<p>Fifa 21 Ultimate Team</p>','12','9','249.90','95','<p>Descubra novas formas de cooperar e se 
expressar nas ruas e nos est??dios. Com tecnologia Frostbite, o??FIFA 21??eleva o??jogo??com novos recursos: Aproveite 
vit??rias ainda maiores junto com os ELENCOS DO FUTEBOL VOLTA e o Co-op do??FIFA??Ultimate Team.</p>','fifa.png','S');

-- Quarta parte
insert into tbl_produto
values
(Default,'4','<p>Gran Turismo Sport</p>','11','4','119.90','62','<p>De motoristas casuais a viciados em combust??vel, 
o Gran Turismo Sport oferece muitas emo????es de alta octanagem para todos os motoristas.Aperte o cinto no seu carro 
preferido e dirija em 17 locais e 40 percursos.O Gran Turismo Sport possui dois campeonatos online, o Nations Cup 
e o Manufacturer???s Cup, al??m do modo de um jogador.</p>','granturismo.png','S'),

(Default,'4','<p>NBA 2K21</p>','16','2','179.90','87', '<p>Comemorando estrelas da NBA como 
Damian Lillard e Zion Williamson, o NBA 2K21 oferece uma imers??o ??nica em todas as facetas na cultura 
e basquete da NBA, onde tudo faz parte do jogo. Com melhorias extensas ?? jogabilidade, incluindo um Pro 
Stick reformulado e movimentos de defesa caracter??sticos, o NBA 2K21 ?? um ??timo jeito de se familiarizar 
com a s??rie NBA 2K. Inclui a vers??o NBA 2K21: Edi????o Mamba Forever, em mem??ria ao falecido Kobe Bryant, 
estrela da NBA.</p>','nba.png','S'),

(Default,'5','<p>Need for Speed Heat</p>','17','10','135.51','35', '<p>O grande chamariz de??NFS Heat????, sem d??vidas, a 
din??mica c??clica das corridas. Basicamente, correr de dia, em eventos oficiais, concede dinheiro para adquirir 
novos carros e acess??rios, enquanto os rachas noturnos concedem pontos de experi??ncia usados para desbloquear 
ve??culos de outras classes e pe??as de desempenho.</p>','needsorspeed.png','S'),

(Default,'5','<p>F1 2020</p>','18','10','208.99','42', '<p>Depois de v??rios anos tendo o modo Carreira como seu carro-chefe,??
F1 2020??muda seu foco e traz como principal atra????o o modo Minha Equipe. Nele, o jogador ?? dono e piloto (ao mesmo 
tempo) de uma nova equipe no mundo da F??rmula 1. ?? poss??vel personalizar logo, cores, pintura, macac??o, capacetes 
e mais.</p>','f1.png','S');

-- Quinta parte
insert into tbl_produto
values
(Default,'5','<p>Need For Speed Hot Pursuit</p>','19','2','99.90','34', '<p>Need For Speed:??Hot Pursuit??Remastered traz 
uma jogabilidade do tipo arcade, em que dificilmente voc?? precisar?? muito do freio para conseguir manter o seu 
carro na pista. J?? para fazer as curvas, ?? claro, voc?? dever?? abusar bastante do drift.</p>','needforfpeedhotpursuit.png','N'),

(Default,'6','<p>Hacknet Edi????o Completa</p>','20','3','79.90','57', '<p>Hacknet ?? um simulador de invas??es cibern??ticas 
imersivo com base em terminais para PC. Entre na toca do coelho enquanto segue as instru????es de um hacker que 
morreu recentemente. E, ao contr??rio do que relata a m??dia, essa morte pode n??o ter sido acidental. Usando 
linhas de comando e processos reais de invas??o de sistemas, voc?? vai resolver o mist??rio com o m??nimo de ajuda 
do jogo em um mundo cheio de segredos para explorar.</p>','hacknet.png','S'),

(Default,'6','<p>The Sims 4</p>','21','11','119.00','0', '<p>O The??Sims 4???? um??jogo??de simula????o de vida, similar aos seus 
antecessores. Os??jogadores??criam um??Sim??e controlam sua vida de modo semelhante ao da vida real, de forma n??o 
linear, j?? que n??o h?? um objetivo espec??fico a ser realizado.</p>','thesims4.png','N'),

(Default,'6','<p>Simcity 3000 Unlimited</p>','21','11','18.50','45', '<p>Construa e gerencie sua pr??pria cidade e veja-a 
ganhar vida. Seja protagonista da sua pr??pria cidade enquanto projeta e cria uma metr??pole linda e movimentada. 
Toda decis??o ?? sua conforme a cidade fica maior e mais complexa. Fa??a escolhas inteligentes para manter seus 
cidad??os felizes e sua cidade cada vez mais ??pica. Ent??o troque, converse, dispute e entre em clubes com outros 
prefeitos. Siga rumo ao extraordin??rio!</p>','simcity.png','N');

-- Sexta parte
insert into tbl_produto
values
(Default,'7','<p>Assassin???s Creed Valhalla</p>','22','12','149.90','23', '<p>Torne-se Eivor, um invasor Viking lend??rio 
em busca de gl??ria. Explore a Idade das Trevas da Inglaterra enquanto ataca seus inimigos, amplia seu assentamento 
e consolida seu poder pol??tico.</p>','assassins.png','N'),

(Default,'7','<p>Battlefield 1942</p>','23','11','120.00','42', '<p>Battlefield 1942 permite que os jogadores entrem em 
um combate de infantaria e sentem atr??s do volante em uma variedade de ve??culos, desde submarinos at?? navios de 
batalha e bombardeiros.</p>','battlefield.png','N'),

(Default,'8','<p>The Witcher RPG</p>','24','3','120.00','39', '<p>Em meio ?? Terceira Guerra Nilfgaardiana, Geralt de 
R??via, o Lobo Branco, percorre o continente em busca do paradeiro de seu amor perdido! Mas esta n??o ?? a ??nica 
hist??ria. Um milh??o de outras aventuras acontecem neste vasto continente e voc?? est?? bem no meio delas!</p>','thewitcher.png','N'),

(Default,'8','<p>The Elder Scrolls V: Skyrim</p>','25','5','749.99','89', '<p>Jogabilidade.??Skyrim???? um??jogo??de RPG que 
mant??m a tradicional jogabilidade de mundo aberto encontrada na s??rie The??Elder Scrolls. O jogador ?? livre para 
andar pela terra de??Skyrim??a sua vontade. Em??Skyrim??h?? nove grandes "posses", com nove capitais que s??o as 
principais cidades do??jogo.</p>','theelderscrollsskyrim.png','S');

-- S??tima parte 
insert into tbl_produto
values
(Default,'8','<p>The Elder Scrolls IV: Oblivion</p>','26','4','144.90','0', '<p>Depois do misterioso assassinato do 
Imperador, Uriel Septim VII, o trono de Tamriel permanece vazio. Com o Imp??rio ?? beira do desmoronamento, os 
portais de??Oblivion??s??o abertos e os Daedras marcham sobre Tamriel, deixando um rastro de destrui????o por onde 
passam.</p>','theelderscrollsoblivion.png','N'),

(Default,'9','<p>Counter-Strike</p>','27','8','144.90','27', '<p>O??jogo???? baseado em rodadas nas quais equipes de 
contraterroristas e terroristas combatem-se at?? a elimina????o completa de um dos times, e tem como objetivo 
principal plantar e desarmar bombas, ou sequestrar e salvar ref??ns.</p>','counterStrike.png','N'),

(Default,'9','<p>Overwatch</p>','25','5','144.90','45', '<p>Overwatch??se passa na Terra em um futuro pr??ximo, anos 
ap??s o fim da crise global Omnica. Esta crise colocou a humanidade sob a amea??a da intelig??ncia artificial 
"Omnic". Isto levou ?? revolta dos rob??s em todo o mundo e um grande conflito em escala global.</p>','overwatch.png','N'),

(Default,'9','<p>Doom</p>','31','3','349.90','67', '<p>Sendo um??jogo??de tiro em primeira pessoa,??Doom???? jogado atrav??s 
do ponto de vista do personagem principal. O objetivo de cada fase ?? simplesmente encontrar a sa??da que leva ao 
pr??ximo n??vel, um bot??o com um sinal "EXIT" em vermelho, enquanto que o objetivo ?? sobreviver a todos os perigos 
ao longo do caminho.</p>','doom.png','N');

-- Oitava parte
insert into tbl_produto
values
(Default,'10','<p>World of Warcraft</p>','28','13','349.90','12', '<p>World of Warcraft?? ?? um??jogo??on-line do g??nero 
MMORPG. O??jogo??se passa no mundo fant??stico de Azeroth, introduzido no primeiro??jogo??da s??rie,??Warcraft: Orcs 
& Humans, lan??ado em 1994.</p>','worldofwarcraft.png','N'),

(Default,'10','<p>Naruto Shippuden: Ultimate Ninja Storm 4 Road to Boruto</p>','29','14','142.00','39', '<p>Com este 
jogo de Naruto, voc?? desfrutar?? de horas de divers??o e novos desafios que permitir??o que voc?? se aprimore como 
jogador. Modo livre ou miss??es a serem cumpridas. Voc?? escolhe jogar entre a linha da hist??ria de Sasuke ou 
Naruto at?? o ponto onde elas se cruzam.</p>','narutoshippuden.png','N'),

(Default,'10','<p>The Elder Scrolls Online</p>','30','3','69.90','26', '<p>The??Elder Scrolls Online??pega o melhor da s??rie 
e aproveita nessa gigantesca plataforma??online. O??jogo???? recheado de miss??es interessantes,??personagens??memor??veis 
e um combate bem din??mico. Al??m disso, o??jogo??apresenta um sistema de cria????o robusto para armas, armaduras, alimentos 
e para desenvolver seu personagem.</p>','theelderscrolls.png','N'),

(default,'11','<p>Xbox Serie X</p>','32','17','4.599','20','<p>O Xbox mais r??pido e poderoso de todos os tempos. O 
Xbox Series X oferece taxas de quadro extraordinariamente est??veis de at?? 120 FPS com o pop visual de HDR. 
Mergulhe em personagens mais n??tidos, mundos mais brilhantes e detalhes incr??veis com o realismo do 4K. O 
Som Espacial em 3D ?? a pr??xima evolu????o em tecnologia de ??udio, usando algoritmos avan??ados para criar mundos 
realistas e envolventes que colocam voc?? no centro de sua experi??ncia.</p>','xboxx.png','N');

-- Nona parte
insert into tbl_produto
values(default,'11','<p>Xbox Serie S</p>','32','17','6.999','22','<p>Desempenho de ??ltima gera????o no menor Xbox de todos os 
tempos. Torne-se totalmente digital com o Xbox Series S e crie uma biblioteca de jogos digitais. Seus jogos, 
salvamentos e backups est??o seguros na nuvem. Al??m disso, aproveite a capacidade de encomendar e pr??-instalar 
os pr??ximos jogos para estar pronto para jogar no momento em que forem lan??ados.</p>','xboxs.png','N'),

(default,'12','<p>PlayStation 5</p>','14','15','4.699','22','<p>O PlayStation 5 ?? o console de nova gera????o que carrega 
todo o legado constru??do pela Sony ao longo de d??cadas de hist??ria no mundo dos games. Dentre suas in??meras 
inova????es, a principal dela ?? o carregamento atrav??s de SSDs (Solid State Drives), que permite minimizar o 
tempo de carregamento de todos os processos dentro do console, eliminando para sempre telas de loading e horas 
de instala????o.</p>', 'PS5.png','N'),

(default,'12','<p>PlayStation 4</p>','14','15','2.499','27','<p>O Sistema do??PS4??foca nos jogadores, garantindo que os 
melhores jogos e a experi??ncia mais imersiva seja poss??vel na plataforma. O console possui seu poder gr??fico 
baseado em um processador poderoso, que possui oito n??cleos funcionando a 64 bits. Entre em diversos desafios 
com sua comunidade gamer e compartilhe seus tri??nfos ??picos ao apertar um simples bot??o, com as novas 
funcionalidades de Streaming, grava????o de v??deo e screenshots.</p>','PS4.png','N'),

(default,'12','<p>PlayStation 4 PRO</p>','14','15','4.499','30','<p>Com seu console PlayStation 4 Pro voc?? ter?? 
entretenimento garantido todos os dias. Sua tecnologia foi criada para colocar novos desafios para jogadores 
novatos e especialistas. Com o console PlayStation 4, l??der mundial de vendas por anos, voc?? poder?? desfrutar 
de horas de jogo e excelente navegabilidade para desfrutar de filmes, s??ries e conte??do online. Qualidade de 
outro n??vel Este console ?? considerado o melhor do mercado, j?? que tem uma resolu????o de at?? 4K. N??o s?? isso, 
o controle DualShock combina recursos revolucion??rios e sem precedentes, preservando a precis??o, conforto e 
exatid??o em cada movimento. Adaptado ??s suas necessidades Salve as suas aplica????es, fotos, v??deos e muito mais 
no disco r??gido, que tem uma capacidade de 1 TB.</p>','PS4pro.png', 'N');

-- D??cima parte
insert into tbl_produto
values(default, '13','<p>Console Nintendo Switch Joy-Con 32GB Azul e Vermelho Neon</p>','33','18','3.360','32',
'<p>O mais novo console da Nintendo promete inovar na jogabilidade, apresentando os joy-cons, controles 
remov??veis e personaliz??veis que atuam por conta pr??pria, captando a dist??ncia das m??os, gestos, e 
movimentos, com um sensor infra vermelho e um girosc??pio. Acompanham tamb??m uma fun????o de vibra????o 
aprimorada, chamada de Rumble HD, que pode transmitir sensa????es t??teis fi??is ?? realidade. O console 
possui uma resolu????o de 720p em seu display de 6.2 polegadas, e 1080p quando conectado a uma TV, e 
traz consigo recursos online totalmente novos, com foco em partidas multiplayer e parties com amigos.</p>','nintendo.png','N'),

(default,'13','<p>Console Nintendo Switch - Modelo Lite Turquesa 32Gb</p>','33','18','1.679','32',
'<p>Apresentando o Nintendo Switch Lite, uma nova vers??o do sistema Nintendo Switch 
otimizada para jogos pessoais e port??teis. O Nintendo Switch Lite ?? um sistema pequeno e leve 
do Nintendo Switch. Com um + Control Pad incorporado e um design elegante e unibody, o Nintendo 
Switch Lite ?? ??timo para jogos em movimento e compat??vel com jogos populares</p>','nintendo1.png','N'),

(default,'14','<p>Monitor Gamer Redragon Blackmagic RGB</p>','4','5','3.126','23','<p>Com um design fino, 
elegante e moderno o Blackmagic, al??m de entregar m??ximo desempenho durante os games, tamb??m d?? 
um toque de estilo ao seu setup mostrando o logo da Redragon projetado na superf??cie.</p>','monitorgamer.png','N'),

(default,'15','<p>Xbox Wireless Controller - Preto Carbono</p>','32','17','54.99','20','<p>Experimente o design 
modernizado do Xbox Wireless Controller, com superf??cies esculpidas e geometria refinada para maior conforto 
durante o jogo.??Fique no alvo com o punho texturizado e um direcional h??brido.??Capture e compartilhe conte??do 
perfeitamente com um bot??o Share dedicado.</p>','controllxbox.png','N');

-- D??cima Primeira parte
insert into tbl_produto
values(default,'15','<p>Xbox Wireless Controller + Wireless Adapter for Windows 10</p>','32','17','79.99','29','<p>Experimente 
o design modernizado do Xbox Wireless Controller, com superf??cies esculpidas e geometria refinada para maior 
conforto durante o jogo.??Fique no alvo com um D-pad h??brido e aperto texturizado nos gatilhos, p??ra-choques e 
caixa traseira.??Com o Adaptador Xbox Wireless inclu??do, voc?? pode conectar at?? 8 Controladores Xbox Wireless de 
uma vez e jogar juntos sem fio no Windows 10 PC.</p>','controllxbox2.png','N'),

(default,'15','<p>Xbox Wireless Controller + USB</p>','32','17','59.99','19','<p>Experimente o design modernizado do Xbox 
Wireless Controller, com superf??cies esculpidas e geometria refinada para maior conforto durante o jogo.??Jogue 
sem fio ou use o cabo USB-C de 9 inclu??do para uma experi??ncia de jogo com fio.??Fique no alvo com um D-pad 
h??brido e aperto texturizado nos gatilhos, p??ra-choques e caixa traseira.</p>','controllxbox1.png','N'),

(default,'19','<p>Razer Turret para Xbox One</p>','32','17','249.90','32','<p>Conhe??a o primeiro teclado e mouse sem fio 
do mundo projetados para Xbox One e PCs com Windows. Ele possui uma precis??o incr??vel em um teclado sem tens??o 
com um tapete de mouse embutido, emparelhado com um mouse com o aclamado Razer 5G Advanced.</p>','tecladoxbox.png','N'),

(default,'20','<p>Adaptador Xbox Wireless para Windows 10</p>','15','17','24.99','45','<p>Com o novo e aprimorado 
Adaptador Xbox Sem Fio para Windows 10, voc?? pode jogar seus jogos de PC favoritos usando qualquer Controle 
Sem Fio Xbox.??Apresenta um design 66% menor, suporte de som est??reo sem fio e a capacidade de conectar at?? 
oito controladores de uma vez.</p>','adaptadorxbox.png','N');

-- D??cima Segunda parte
insert into tbl_produto
values(default,'18','<p>PDP Gaming Talon Media Remote</p>','32','17','19.99','34','<p>Chega de se atrapalhar com o bot??o 
direito do controlador para pausar o filme.??Com um design de controle remoto de TV tradicional, voc?? pode 
acessar rapidamente os controles de reprodu????o, salto e volume junto com os controles comuns do Xbox como A, 
B, X, Y e um D-pad.??Os bot??es retroiluminados ativados por movimento, que agora s??o mais duradouros, ajudam 
voc?? a encontrar os bot??es certos, mesmo no escuro.</p>','controlexbox.png','N'),

(default,'17','<p>Fone de ouvido sem fio Xbox</p>','32','17','99.99','34','<p>Experimente ??udio de alta qualidade 
com baixa lat??ncia, conex??o 100% sem fio com o console Xbox, sem a necessidade de dongle ou esta????o base.</p>','fonedeouvidoxbox.png','N'),

(default,'17','<p>Portal Beoplay da Bang & Olufsen</p>','32','17','499.00','32','<p>O design elegante do Portal 
Beoplay significa que voc?? pode us??-los em qualquer situa????o.??Os fones de ouvido v??m com fun????es de jogo de 
acesso r??pido, conectividade s??lida para jogos m??veis e som surround virtual Dolby Atmos para uma experi??ncia 
de jogo imersiva no Xbox e outras plataformas compat??veis.</p>','fonedeouvidoxbox1.png','N'),

(default,'20','<p>Cabo HDMI</p>','12','17','14.99','50','<p>Desbloqueie todo o potencial dos consoles de jogos de 
??ltima gera????o com um cabo HDMI de fibra ??ptica que vai longe.??O cabo HDMI importa 48 Gbps de fibra combina o 
mais recente em padr??es HDMI com um chipset ativo e n??cleos de fibra ??ptica para garantir uma imagem n??tida e 
confi??vel a dist??ncias imposs??veis com cabos HDMI de cobre tradicionais.??Aproveite ao m??ximo o suporte de 4K 
120 Hz do Xbox Series X conforme especificado em HDMI 2.1 com este cabo Projetado para Xbox.</p>','hdmi.png','N');

-- D??cima Terceira parte
insert into tbl_produto
values(default,'15','<p>Controle sem fio DualSense</p>','14','15','64.99','23','<p>Descubra uma experi??ncia de jogos mais 
profunda e altamente imersiva??1??com o novo controle do PS5???, que oferece feedback t??til e efeitos de gatilho 
din??micos??2. O controle sem fio DualSense tamb??m inclui um microfone integrado e bot??o de cria????o, tudo em um 
design ic??nico e confort??vel.</p>','playstationcontroll.png','N'),

(default,'16','<p>Headset sem fio PULSE 3D</p>','14','15','599.00','37','<p>Desfrute de conforto ao jogar com um 
headset sem fio ajustado para ??udio 3D em consoles PS52. Com carregamento USB Type-C e dois microfones para 
cancelamento de ru??do, voc?? pode curtir o bate-papo com a maior nitidez de voz.</p>','playstationheadset.png','N'),

(default,'18','<p>Controle de m??dia</p>','14','15','199.00','12','<p>Conveni??ncia e um layout intuitivo para voc?? 
controlar filmes, servi??os de streaming??e muito mais no seu console PS5.</p>','playstationcontrole.png','N'),

(default,'15','<p>Controle sem fio DUALSHOCK 4</p>','14','15','279.00','43','<p>Assuma controle total de todos os 
jogos usando o controle com design mais inteligente que j?? criamos, com gatilhos responsivos, controles refinados, 
empunhaduras texturizadas e uma s??rie de recursos inovadores que aproximam voc?? mais ainda dos seus jogos.</p>',
'playstationcontroll1.png','N');

-- D??cima Quarta parte
insert into tbl_produto
values(default,'16', '<p>Headset sem fio s??rie Ouro</p>', '14', '15', '439.00', '33', '<p>Desfrute do padr??o Ouro em ??udio de 
jogos com o headset sem fio s??rie Ouro repaginado; agora com conforto refinado e dois microfones embutidos para 
uma melhor comunica????o nos jogos.</p>', 'playstationheadset1.png','N'),

(default,'19','<p>Teclado Microsoft Bluetooth</p>','16','15','266.99','22','<p>Aprecie a sensa????o s??lida do nosso 
teclado moderno e elegante enquanto voc?? trabalha no Windows e no Office 365. O design sem fio apresenta teclas 
de atalho para economia de tempo e pares com o seu laptop via Bluetooth. Uma experi??ncia de digita????o sem fio 
elegante, o design sem fio combina perfeitamente com o seu laptop via Bluetooth e oferece uma bateria extra 
longa at?? 2 anos. Design fino e moderno a um valor excepcional.</p>','microsoftteclado.png','N'),

(default,'19','<p>Teclado Microsoft 600</p>','16','15','124.90','45','<p>O teclado com fio 600 est?? pronto quando voc??,
 n??o precisa procurar um teclado de qualidade que ofere??a grande valor. Obtenha todos os recursos de que voc?? precisa - 
e muito mais - com qualidade e confiabilidade da Microsoft. As teclas de toque silencioso e o acesso r??pido aos 
controles de m??dia simplificam a maneira como voc?? usa o computador e permitem que voc?? se concentre na tarefa 
em quest??o.</p>','microsoftteclado1.png','N'),

(default,'21','<p>Cabo De For??a Tripolar Para Fonte 3x0,75 mm 1,2 Metros</p>','12','8','9.90','45','<p>Cabo De For??a 
Tripolar para Computador, Cpu, Monitor 10a, comprimento aproximadamente 1,20m, compat??vel com Computador (PC / Desktop)</p>',
'cabodeforca.png','N');

create view view_produto 
as select
	tbl_produto.cod_produto,
    tbl_categoria_produto.descricao_categoria_produto,
    tbl_produto.nome_produto,
    tbl_desenvolvedor.nome_desenvolvedor,
    tbl_fornecedor.nome_fornecedor,
    tbl_produto.valor_preco,
    tbl_produto.qtd_estoque,
    tbl_produto.descricao_produto,
    tbl_produto.descricao_capa,
    tbl_produto.sg_lancamento
from tbl_produto inner join tbl_categoria_produto
	on tbl_produto.cod_categoria_produto = tbl_categoria_produto.cod_categoria_produto
inner join tbl_desenvolvedor
	on tbl_produto.cod_desenvolvedor = tbl_desenvolvedor.cod_desenvolvedor
inner join tbl_fornecedor
	on tbl_produto.cod_fornecedor = tbl_fornecedor.cod_fornecedor;

create view view_venda
as select 
	tbl_venda.data_venda,
	tbl_venda.numero_ticket,
	tbl_venda.cod_cliente,
	tbl_produto.nome_produto,
	tbl_venda.qtd_produto,
	tbl_venda.valor_total_item
from tbl_venda inner join tbl_produto 
	on tbl_venda.cod_produto = tbl_produto.cod_produto;

use loja_games;
drop database loja_games;
drop table tbl_categoria_produto;
drop table tbl_produto; 
drop table tbl_desenvolvedor;
drop table tbl_fornecedor;
drop table tbl_usuario;
drop table tbl_venda;
drop view view_produto;
drop view view_venda;

select * from tbl_categoria_produto;
select * from tbl_produto; 
select * from tbl_desenvolvedor;
select * from tbl_fornecedor;
select * from tbl_usuario;
select * from tbl_venda;
select * from view_produto;
select * from view_venda;