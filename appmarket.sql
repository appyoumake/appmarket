-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 04. Sep, 2017 11:03 AM
-- Server-versjon: 5.7.19-0ubuntu0.16.04.1
-- PHP Version: 7.0.22-0ubuntu0.16.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `appmarket`
--

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `access_group`
--

CREATE TABLE `access_group` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `enabled` int(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `app`
--

CREATE TABLE `app` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `package_id` varchar(255) DEFAULT NULL,
  `mlab_guid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `keywords` text,
  `category1` varchar(255) DEFAULT NULL,
  `category2` varchar(255) DEFAULT NULL,
  `category3` varchar(255) DEFAULT NULL,
  `publisher_org_name` varchar(255) DEFAULT NULL,
  `state` enum('published','unpublished','withdrawn') DEFAULT NULL,
  `size` int(11) DEFAULT '0',
  `icon` mediumblob,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `app`
--

INSERT INTO `app` (`id`, `user_id`, `package_id`, `mlab_guid`, `name`, `description`, `keywords`, `category1`, `category2`, `category3`, `publisher_org_name`, `state`, `size`, `icon`, `created_at`, `updated_at`) VALUES
(1, 2, 'no.ffi.myapp', '4eb5046865ff5258e339e124a909e3da', 'My app', 'A cool new app', 'new, app, for, testing', 'Land', '', '', NULL, 'published', 0, 0x646174613a696d6167652f706e673b6261736536342c6956424f5277304b47676f414141414e5355684555674141415a4141414147514341594141414341767a624d4141414149474e49556b304141486f6d41414341684141412b6741414149446f414142314d414141366d41414144715941414158634a793655547741414141455a30464e51514141735935382b3147544141414141584e5352304941727334633651414141415a6953306445415038412f77442f6f4c326e6b77414141416c7753466c7a4141414f78414141447351426c53734f47774141446d424a52454655654e727433516d5556665639775048666d773059466c6c47484a516f67724a61424c554b4b414975594e4736746e69694e53595270566b617852794f706a6c5650446c5a3142687431455a4e596d4a534536317867594a374157554a4957725a6c465563444d714f67417a624d444e393979495930395a35494c5042352b4f3567764465764f472b5962372b3737332f2f3430414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414b434f5a44376a3877646e743046324930436a6464762b507248674d373577456f2b78396a2f416f5265515050734f4141454251454141454241414241514142415141415146415141426f46417271346b553639527563626744556a624b5a55394c746f416a493442747539593443314a457039305374423851684c41414542414142415542414142415141424151414151454141454251454141454241414542414142415141415146415141415145414151454141454241414241554241414241514142415141415145414145425145414145424141454241414241514141514641514141514541415145414145424141424155424141424151414241514141514541414542514541415145414145424141424151414151464151414241514141514541414542414142415542414145424141424151414151454141454251454141514541414542414142415141415146415141424151414151454141454241414241554241414542414142415141415145414145425145414151454141454241414241514141514641514f77434141514541414542514541414542414145424141506f4d43753443475a6d66356c6969624f53586433702f33656d78362f393359766e6c6a564662736a4f724b71716975716f7a495a4437786e4861647530574c6b694f697a5446646f6b50505074466c304c426f6664517864695949434165374c5774587859794866686a7a4a7a77654836356547645856565a483956383750583731675471784f666a4c3134312f4c354f56466b7861743472427353447230366874647a786f65705433375274744f787833777a33397370307944334b396a7936703963534567484a78574c35676234322b2b4e6a765365433037737167366f4238372b586a4a7943585a6b73444d65664b5279433873696b782b66687a5a2b35513466764477364e5276554854733238386241514a435935463855332f6961794e693262542f326a3361714150563252484e72703037307038762f384f7273584c2b477a483967647654304e773862364d3342515345686d374a3547666a385647583776316d586c2b5363793241674e4249544c727258324c716664394e52774f416745424f4873754f4f68612b2b4d772b6e5277484249524433424e667533792f34354666314353614e47385a56636e6c757838396639654f37656d3569384a6d78656c2f4a7a396d4d6e6e70315678566c627673634241514467597a482f3758575044386b2f73556a366174576b66463971315230726c624844766737436a7431536564313947717447506b4652536b76312b3161316673334c6f6c2f58487a716857785a643371574c4e6f6672773365316138502f6550556246746130526558757a617673326241414a435937507172646e7830673975796f344b4b6e4d4c783246746f6967376d686877335a6a6f666647565564793235464d66762b663339383774754f447976622b336565574b5744783559727a2b36494f7839753246325a626b5a594e54586d2f377770774d4241543277564d33584257564f5635746c52794747766a566230582f6130616e6f347a50716c57486a6e484b466150534c596e4a3743636669566d50334a664f614e2f2b3461616f7a6a4671674942517878612b4e4334327258773335354848465438624830662f39526d3138726b6b4d546e7a36392b4f4d2f3778706c6a36366773782f594537306e6b677962496f4651357867594451734579392f33733548544971614e4930526a343149307136644b2f317a796b5a32585139362f783053773676546637524c62466b386e50654c424151476f726b6b4e48614a517471504579555831675966335072505855536a37395532724e506644343736746c51747451624276767a50325232416255684f587a56736e324847683958334b35396e487a46714872395847746a63555551454e685079564c73795757344e656e3764312b79733042413447504a66497a793957732f2f55475a5450532b35456f374377514550725a7852566d4e6c2b396d7376386b45774d42415946554d6a4d385757716b4a736b79376b584e5739686849434477305264566a704d414d356c4d656c385151454267722b596c5239513841736c757957512b514542677233624848702f65507662544331496430782b3630383443415947504a5a50306d725675572b506a33706b2b4b5a305244676749704472314778795a764a712f764a4b464458383738694b7a77554641594c666a7a68795738776e79625a7332784d387537522b4c4a303230343042414f4e516c6c2b636d45636c6c464c4b7a664574556243325070322f38516a7a397a61754e52714352734a676974576251396266456b6c65657a2b6d4f674d6d5336736d32364b58787366434670394e44594830767679614e554c4a614c79416748454b53452b6e483968385353374d52536535666e6f73396837325377316e762f6e4661564f7a5948702f7232792b366e7632336365794149656e484241534551384246642f7738376833534c585a73326278507a30754373323354422b6e50332f6e39354669656a556c2b51554836362b30366434756a546a77316a687438587054324f4c4852724b5937746c4f6d626c374872584d52454134474c5134766a52482f396b543864755346735376485739762b58367032566152625976584375656b32352b6c665253617a2b787a4c4564313778334744686b575867554f6a5933624563694275695173494350577379356c4434384c73534754636d432b6e6c2b30654b4a5537502f35593738325a6c5737544872676a2f65396a5468305970313339543348386b4f466941674a43593962373469756a6f4b68705044583648334a616148482f6f374a376c4c4e73327374524e764f56394936487663346645656663395031304e415149434931517a2b475852576e50452b4e585677324e7a53762f6c4b376157357632485061612f6274667872787876346c753531345977322b3756306a6741444550684471566e50442b787554466365374e74306468732b6152796375766b39644e4470323939657a7634753442523865557538643649304241614a52666441554630582f6b6a584854374858706f61586d3764725832586d4b796f714b654f58653738543951302b497252765765544e415147694d6b676d437034386145324e65587831666647784b39446a7673696871336a4c79386d73334a736d6c7747735876786b2f486e783872466e30706a63433976667673463141513344304b61656e57324c643277746a2f6f54485939474c343250394f34765347657135546b546346386d6b785a39656646714d6d7642616c4854705875742f52764d7a4542436f5a636b333838485833357075696552513034722f6e686c7654333078765148562b6e63577839614e47364b367376497a7631624674764930496c3935626b363037746a4a7a67634234574253334c596b75703539516272397566584c4673666338622b4a785339506944574c352b2b39684864664a5973352f7671716f664756352b64616477734568454e42753835645938674e59394d746b537a432b4f723933347556383936493675726344336b6c6838664b31362b4e61542b3550516266634b736443774c436f6162377345765362635079742b4f4a723436493151766e5246574f68376d53387948544837777a54726c796c486b696b434e58595848516158744d6c786731386655592b50567631337866396a2f54724857626d504854752b78414542414f64554e473378626e335053444b4370756e74506a4e36396345664f65656254575a3869446745416a30482f6b364f68793572426f646c6962334a3651796354373831367a34304241494e4a6c5579707a48465530626455365859515245424249313938362b7551425564796d585932505456594b587658576244734e42415232367a7a77334368753137374778323362754345324c46397168344741774735482f74584a45546b7368354a637a6d7552525241513243745a7069534a517936714b6c324642514943653737513877756938714e377175667957454241594f2b6f4974644a685761696734444158736e6871377a4377686f663136524679326a566f614d6442674943753631627469674b6d7a53724f5341744434763258552b77773042417145384e3657716d5a644e656a6830666271727863636e4b764b57392b6e6a7a5145436f542f65643079506d50764e6f76583865796547722b662f355747785a743772477832373759483130486e43324e77384568506f6567627a36342b2f457733382f4d4e366657332f725379584c744263553558616a714e4b6566614b6f655174764867674939533035393742312f6472343952654778564f6a72346f4e5a58553779377473357053592b664139736657446d672b6e4e543273546651624f647162426a6c7977547431457045393338776666476c6365744f6e30363862452b32373165374a366d525278482f2f3476445974583162626b2b6f726f72753531376b44514d426f61464a3772655257506a6975466a7733465052345953543472517666534f366e6e582b416230586558492f6a386c333378497a48726f724b697432357653637771624e3475777833336450644241514772493956304d746e2f567172487a7a6a66544b7038356e6e424d6e662f3636364854616f50302b4235476563376e2f752f4847597a2b50697131626f7271364f75666e746a7a69794f7a72582b764e415147687364685a766958396364464c3432504a3547636a71704f5a3445644561632b2b63565366552b4e7a4a2f57506b6937642f39666b76693172563857367051766a76546d7a59746d4d53624636775a776f5837386d6a64472b4b6d7857484663385043487943767831414147685564707a4b396e4e7139354c743857544a74542b5834436d7a654c694f332b5252676f51454d6874354a474e7839422f2f6d4830756d43456e514543416a584c354f566c343145636c2f7a6f6b6568783371563243416749445646794f396e6b6346544f6c394c57737551456665756a4f7357496e7a7a6873425549434133566a622f2f55377a31334a50783573542f5345397974326a6649625a75574276624e322b7138382b6c535974576b636c6b347078763352346e6a626a4743584d5145427179354d7170666c2b2b507432537136595754356f59533139355072753945455846785a46663143544b3136324a585475323139706f49354f584879314b326b662f6137385a66533637326a7750454241616d2b516d54536464666b32364a5a4b3173643539625870326d7862767a706f614f386f2f6a4f49324a5a484a7a3438646d7a6647746b3066374e50485430364946325648476456566c656b49352f446a756b6576437935504a796b6d3631734241734a4234736a65703652624d6a704a4a4a4d4156387a2b51367837653247735754512f4e705174695933764c5539484b48746d6b2b6358464837697472524a6c4a71334f7a796442466a53705564367671573078346e70783633726b636259736d70764b6749433961473462556b36576b69322f3038793664424b7564427757493258526b4d385145414145424141424151414241514141514641514141514541414542414145424141424155424141424151414241514141514541414542514541414542414145424141424151414151464151414151454141514541414542414142415542414142415141424151414151454141454251454141454241414542414142415141415146415141415145414151454141454241414241554241414241514142415141415145414145425145414151454141454241414241514141514641514142415141415145414145424141424155424141454241414241514141514541414542514541415145414145424141424151414151464151414241514141514541414542414142415542414145424141424151414151454141454251454141514541414542414147714b43756e695273706c5459736f39646a5a4158556d2b3778343041616d4c50777741646363684c4141454241414241554241414241514142415141415145414145424141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415075462f41456d3043786a43734456564141414141456c46546b5375516d4343, '2017-05-09 01:58:57', '2017-05-09 01:58:57');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `apps_access_groups`
--

CREATE TABLE `apps_access_groups` (
  `app_id` int(11) DEFAULT NULL,
  `access_group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `device`
--

CREATE TABLE `device` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `os` varchar(25) DEFAULT NULL,
  `os_version` varchar(25) NOT NULL DEFAULT '1',
  `enabled` int(1) DEFAULT '1',
  `last_access` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `device`
--

INSERT INTO `device` (`id`, `user_id`, `uid`, `os`, `os_version`, `enabled`, `last_access`, `created_at`, `updated_at`) VALUES
(3, 2, 'mlab_builder', 'windows', '10', 1, '2017-05-08 23:12:15', '2017-05-08 23:12:15', '2017-05-08 23:12:15');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `devices_versions`
--

CREATE TABLE `devices_versions` (
  `device_id` int(11) NOT NULL,
  `version_id` int(11) NOT NULL,
  `state` enum('unknown','downloaded','used','uninstalled') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `grp`
--

CREATE TABLE `grp` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `enabled` int(1) DEFAULT '1',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `grp`
--

INSERT INTO `grp` (`id`, `name`, `description`, `enabled`, `created_at`, `updated_at`) VALUES
(1, 'General', 'General group', 1, '2017-05-07 00:00:00', '2017-05-08 00:00:00'),
(2, 'FFI', 'FFI specific group', 1, '2017-05-07 00:00:00', '2017-05-07 00:00:12');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `screenshot`
--

CREATE TABLE `screenshot` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `image` mediumblob,
  `mimetype` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `token`
--

CREATE TABLE `token` (
  `id` int(11) NOT NULL,
  `device_id` int(11) NOT NULL,
  `token` varchar(255) DEFAULT NULL,
  `expires` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `token`
--

INSERT INTO `token` (`id`, `device_id`, `token`, `expires`, `created_at`, `updated_at`) VALUES
(3, 3, '6739ff54-e6a7-416d-a56b-0e6eaef41632', '2017-05-09 10:46:45', '2017-05-09 01:46:45', '2017-05-09 01:46:45');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users_access_groups`
--

CREATE TABLE `users_access_groups` (
  `user_id` int(11) NOT NULL,
  `access_group_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `users_groups`
--

CREATE TABLE `users_groups` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `users_groups`
--

INSERT INTO `users_groups` (`user_id`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2017-05-07 00:00:00', '2017-05-07 00:00:00'),
(2, 2, '2017-05-07 00:00:00', '2017-05-07 00:00:00');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `usr`
--

CREATE TABLE `usr` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `salt` varchar(255) DEFAULT NULL,
  `role` enum('ROLE_USER','ROLE_ADMIN','ROLE_SUPER_ADMIN') DEFAULT NULL,
  `state` enum('registered','active','inactive','rejected','disabled') DEFAULT NULL,
  `last_access` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `usr`
--

INSERT INTO `usr` (`id`, `email`, `first_name`, `last_name`, `password`, `salt`, `role`, `state`, `last_access`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'arild@bergh.fm', NULL, NULL, '$2a$08$PXX60Yb7N.U8BFnea6XYO.4Qd4g26OVs8uVzEa06Cr8W1a3fesi92', NULL, 'ROLE_ADMIN', NULL, NULL, NULL, '2017-05-08 12:21:48', '2017-05-08 12:21:48'),
(2, 'info@bergh.fm', NULL, NULL, '$2a$08$l2V9HxnW6lV2/45FH2A1RuCIhUKTualXd1VlxN6d7/JSX1HtzwBVm', NULL, 'ROLE_USER', NULL, NULL, NULL, '2017-05-08 13:49:54', '2017-05-08 13:49:54'),
(3, 'admin@ffi.no', 'Jonathan', 'Dimbleby', 'password', NULL, 'ROLE_SUPER_ADMIN', 'active', NULL, NULL, '2017-05-09 00:02:43', '2017-05-09 00:02:43');

-- --------------------------------------------------------

--
-- Tabellstruktur for tabell `version`
--

CREATE TABLE `version` (
  `id` int(11) NOT NULL,
  `app_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `superceded_by_version_id` int(11) DEFAULT NULL,
  `version` varchar(25) NOT NULL DEFAULT '1.0.0',
  `update_notes` text,
  `os` varchar(25) NOT NULL,
  `os_version` varchar(25) NOT NULL DEFAULT '1',
  `download_count` int(11) DEFAULT '0',
  `state` enum('waiting_for_file','ready','superceded') DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dataark for tabell `version`
--

INSERT INTO `version` (`id`, `app_id`, `user_id`, `superceded_by_version_id`, `version`, `update_notes`, `os`, `os_version`, `download_count`, `state`, `created_at`, `updated_at`) VALUES
(1, 1, 2, NULL, '1.0', NULL, 'android', '1', 0, 'waiting_for_file', '2017-05-09 01:58:57', '2017-05-09 01:58:57');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_group`
--
ALTER TABLE `access_group`
  ADD PRIMARY KEY (`id`),
  ADD KEY `access_group_group_id` (`group_id`),
  ADD KEY `access_group_name` (`name`),
  ADD KEY `access_group_enabled` (`enabled`);

--
-- Indexes for table `app`
--
ALTER TABLE `app`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `package_id` (`package_id`),
  ADD UNIQUE KEY `mlab_guid` (`mlab_guid`),
  ADD UNIQUE KEY `app_packageId_unique` (`package_id`),
  ADD UNIQUE KEY `app_mlabGuid_unique` (`mlab_guid`),
  ADD KEY `app_user_id` (`user_id`),
  ADD KEY `app_name` (`name`),
  ADD KEY `app_category1` (`category1`),
  ADD KEY `app_state` (`state`),
  ADD KEY `app_category2` (`category2`),
  ADD KEY `app_category3` (`category3`);
ALTER TABLE `app` ADD FULLTEXT KEY `app_description` (`description`);
ALTER TABLE `app` ADD FULLTEXT KEY `app_keywords` (`keywords`);

--
-- Indexes for table `apps_access_groups`
--
ALTER TABLE `apps_access_groups`
  ADD PRIMARY KEY (`access_group_id`),
  ADD UNIQUE KEY `apps_access_groups_accessGroupId_app_id_unique` (`access_group_id`,`app_id`),
  ADD KEY `apps_access_groups_app_id` (`app_id`),
  ADD KEY `apps_access_groups_access_group_id` (`access_group_id`);

--
-- Indexes for table `device`
--
ALTER TABLE `device`
  ADD PRIMARY KEY (`id`),
  ADD KEY `device_user_id` (`user_id`),
  ADD KEY `device_uid` (`uid`),
  ADD KEY `device_os_os_version` (`os`,`os_version`),
  ADD KEY `device_enabled` (`enabled`),
  ADD KEY `device_last_access` (`last_access`);

--
-- Indexes for table `devices_versions`
--
ALTER TABLE `devices_versions`
  ADD PRIMARY KEY (`device_id`,`version_id`),
  ADD UNIQUE KEY `devices_versions_deviceId_versionId_unique` (`device_id`,`version_id`),
  ADD KEY `devices_versions_device_id` (`device_id`),
  ADD KEY `devices_versions_version_id` (`version_id`),
  ADD KEY `devices_versions_state` (`state`);

--
-- Indexes for table `grp`
--
ALTER TABLE `grp`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `grp_name_unique` (`name`),
  ADD KEY `grp_enabled` (`enabled`);

--
-- Indexes for table `screenshot`
--
ALTER TABLE `screenshot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `screenshot_app_id` (`app_id`);

--
-- Indexes for table `token`
--
ALTER TABLE `token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `token_device_id` (`device_id`),
  ADD KEY `token_expires` (`expires`);

--
-- Indexes for table `users_access_groups`
--
ALTER TABLE `users_access_groups`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_access_groups_userId_accessGroupId_unique` (`user_id`,`access_group_id`),
  ADD UNIQUE KEY `users_access_groups_userId_access_group_id_unique` (`access_group_id`),
  ADD KEY `users_access_groups_user_id` (`user_id`),
  ADD KEY `users_access_groups_access_group_id` (`access_group_id`);

--
-- Indexes for table `users_groups`
--
ALTER TABLE `users_groups`
  ADD PRIMARY KEY (`user_id`,`group_id`),
  ADD UNIQUE KEY `users_groups_userId_groupId_unique` (`user_id`,`group_id`),
  ADD KEY `users_groups_user_id` (`user_id`),
  ADD KEY `users_groups_group_id` (`group_id`);

--
-- Indexes for table `usr`
--
ALTER TABLE `usr`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `usr_email_unique` (`email`),
  ADD KEY `usr_last_name` (`last_name`),
  ADD KEY `usr_role` (`role`),
  ADD KEY `usr_first_name` (`first_name`),
  ADD KEY `usr_last_access` (`last_access`),
  ADD KEY `usr_state` (`state`),
  ADD KEY `usr_deleted_at` (`deleted_at`);

--
-- Indexes for table `version`
--
ALTER TABLE `version`
  ADD PRIMARY KEY (`id`),
  ADD KEY `version_user_id` (`user_id`),
  ADD KEY `version_app_id` (`app_id`),
  ADD KEY `version_superceded_by_version_id` (`superceded_by_version_id`),
  ADD KEY `version_version` (`version`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_group`
--
ALTER TABLE `access_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app`
--
ALTER TABLE `app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `device`
--
ALTER TABLE `device`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `grp`
--
ALTER TABLE `grp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `screenshot`
--
ALTER TABLE `screenshot`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `token`
--
ALTER TABLE `token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `usr`
--
ALTER TABLE `usr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `version`
--
ALTER TABLE `version`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Begrensninger for dumpede tabeller
--

--
-- Begrensninger for tabell `access_group`
--
ALTER TABLE `access_group`
  ADD CONSTRAINT `access_group_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `grp` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Begrensninger for tabell `app`
--
ALTER TABLE `app`
  ADD CONSTRAINT `app_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Begrensninger for tabell `apps_access_groups`
--
ALTER TABLE `apps_access_groups`
  ADD CONSTRAINT `apps_access_groups_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apps_access_groups_ibfk_2` FOREIGN KEY (`access_group_id`) REFERENCES `access_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `device`
--
ALTER TABLE `device`
  ADD CONSTRAINT `device_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Begrensninger for tabell `devices_versions`
--
ALTER TABLE `devices_versions`
  ADD CONSTRAINT `devices_versions_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `version` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `devices_versions_ibfk_2` FOREIGN KEY (`version_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `screenshot`
--
ALTER TABLE `screenshot`
  ADD CONSTRAINT `screenshot_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `token`
--
ALTER TABLE `token`
  ADD CONSTRAINT `token_ibfk_1` FOREIGN KEY (`device_id`) REFERENCES `device` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `users_access_groups`
--
ALTER TABLE `users_access_groups`
  ADD CONSTRAINT `users_access_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_access_groups_ibfk_2` FOREIGN KEY (`access_group_id`) REFERENCES `access_group` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `users_groups_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `users_groups_ibfk_2` FOREIGN KEY (`group_id`) REFERENCES `grp` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Begrensninger for tabell `version`
--
ALTER TABLE `version`
  ADD CONSTRAINT `version_ibfk_1` FOREIGN KEY (`app_id`) REFERENCES `app` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `version_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `usr` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
