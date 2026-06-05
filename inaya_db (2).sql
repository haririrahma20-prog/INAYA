-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 17 mai 2026 à 19:53
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `inaya_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_fr` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`id`, `name_en`, `name_fr`, `name_ar`) VALUES
(1, 'Skin', 'Peau', 'بشرة'),
(2, 'Hair', 'Cheveux', 'شعر'),
(3, 'Makeup', 'Maquillage', 'مكياج'),
(4, 'Body', 'Corps', 'جسم');

-- --------------------------------------------------------

--
-- Structure de la table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `type` enum('morning','evening','system') DEFAULT NULL,
  `status` enum('unread','read') DEFAULT 'unread',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name_en` varchar(150) DEFAULT NULL,
  `name_fr` varchar(150) DEFAULT NULL,
  `name_ar` varchar(150) DEFAULT NULL,
  `description_en` text DEFAULT NULL,
  `description_fr` text DEFAULT NULL,
  `description_ar` text DEFAULT NULL,
  `how_to_use_en` text DEFAULT NULL,
  `how_to_use_fr` text DEFAULT NULL,
  `how_to_use_ar` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `step_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`id`, `name_en`, `name_fr`, `name_ar`, `description_en`, `description_fr`, `description_ar`, `how_to_use_en`, `how_to_use_fr`, `how_to_use_ar`, `image`, `price`, `step_id`, `created_at`) VALUES
(1, 'Biolila Gel Cleanser 125 ml', 'Biolila Gel Nettoyant 125 ml', 'غسول بيوليلة 125 مل', 'Refreshing cleanser that deeply purifies the skin and gives instant glow', 'Le secret algérien du soin coréen. Un gel nettoyant rafraîchissant qui purifie la peau en profondeur et lui apporte un éclat immédiat.', 'غسول منعش ينظف البشرة بعمق ويمنحها إشراقة فورية', 'Apply a small amount on wet skin morning and evening, massage gently then rinse with lukewarm water', 'Appliquez une petite quantité sur une peau humide matin et soir. Massez délicatement jusqu’à obtenir une mousse (évitez le contour des yeux). Rincez à l’eau tiède puis séchez votre visage en tapotant doucement. Pour de meilleurs résultats : utilisez-le comme deuxième étape après Biolila Huile Nettoyante dans votre routine du soir.', 'ضعي كمية صغيرة على بشرة مبللة صباحاً ومساءً، دلكي بلطف حتى تتكون رغوة ثم اشطفي بالماء الفاتر وجففي بلطف.', 'https://adibabeauty.com/cdn/shop/files/rn-image_picker_lib_temp_88ddf656-01fb-451f-82c4-16de1888f095.png?v=1751671317', 1350.00, 1, '2026-04-25 15:18:49'),
(2, 'Nila Blue Face Cleanser 250ml', 'Gel Nettoyant Visage à la Nila Bleue - 250ml', 'غسول الوجه بالنيلة الزرقاء 250 مل', 'Purifying cleanser that deeply cleanses the skin and provides natural brightening', 'Ce gel nettoyant est un soin purifiant conçu pour nettoyer la peau en profondeur tout en apportant un effet éclaircissant naturel. Sa formule légère élimine les impuretés, les résidus de pollution et l’excès de sébum sans agresser l’épiderme.', 'غسول منظف ينقي البشرة بعمق ويمنحها تفتيح طبيعي مع إزالة الشوائب والزيوت الزائدة دون تهييج البشرة', 'Apply a small amount on wet face, massage gently then rinse with lukewarm water', 'Appliquer une petite quantité de gel sur le visage humide, masser délicatement en mouvements circulaires, puis rincer abondamment à l’eau tiède.', 'ضعي كمية صغيرة على وجه مبلل، دلكي بلطف بحركات دائرية ثم اشطفي بالماء الفاتر', 'https://adibabeauty.com/cdn/shop/files/165C54F4-51D1-49E9-8EF9-EB96C069B1C9.jpg?v=1760821030', 450.00, 1, '2026-04-25 15:31:42'),
(3, 'Venus Cleansing Gel 150ml', 'Gel nettoyant Venus 150ml', 'غسول فينوس 150 مل', 'Daily facial cleansing gel designed for effective and gentle skin hygiene. Removes impurities, pollution, and excess sebum.', 'La gamme de gels nettoyants Viderm de Venus est conçue pour offrir une hygiène faciale quotidienne efficace et respectueuse de la peau. Grâce à des formules testées dermatologiquement, ces nettoyants éliminent en douceur les impuretés, les traces de pollution et l\'excès de sébum accumulés durant la journée.', 'غسول يومي للوجه مصمم لتنظيف البشرة بفعالية ولطف، يزيل الشوائب وآثار التلوث والزيوت الزائدة دون الإضرار بالبشرة.', 'Apply a small amount on wet face, massage gently for one minute, then rinse with water. Use morning and evening.', 'Appliquez une petite quantité sur visage humide, massez délicatement pendant une minute, puis rincez à l\'eau. Utilisez matin et soir.', 'ضعي كمية صغيرة على وجه مبلل، دلكي بلطف لمدة دقيقة ثم اشطفي بالماء. يُستعمل صباحاً ومساءً.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKdnu3WXHZaDFeM_cH6Lg76ZkhA5907oRmXA&s', 450.00, 1, '2026-04-25 15:45:15'),
(4, 'Biolila Purifying Toner 180ml', 'Lotion Tonique Purifiante Biolila (180ml)', 'تونر بيولِيلا المنقي 180 مل', 'Refreshing and purifying toner inspired by Korean beauty secrets. Helps rebalance the skin, tighten pores, and provide instant glow with a smooth texture.', 'Lotion tonique rafraîchissante et purifiante pour la peau, formulée avec une composition unique inspirée des secrets de la beauté coréenne. Elle agit comme une étape essentielle après le nettoyage pour rééquilibrer la peau, resserrer les pores et lui offrir un éclat immédiat ainsi qu’une texture douce et soyeuse.', 'تونر منعش ومنقي للبشرة مستوحى من أسرار الجمال الكوري، يساعد على إعادة توازن البشرة، تضييق المسام ومنحها إشراقة فورية وملمس ناعم.', 'After cleansing and drying your face, apply an appropriate amount to a cotton pad or your hands. Gently sweep over face and neck, avoiding eyes. Use twice daily.', 'Après avoir nettoyé et séché votre visage, appliquez une quantité appropriée de tonique sur un coton ou directement dans le creux de votre main. Passez-le délicatement sur le visage et le cou (en évitant le contour des yeux). À utiliser deux fois par jour (matin et soir).', 'بعد تنظيف وتجفيف الوجه، ضعي كمية مناسبة على قطعة قطن أو في راحة اليد، ومرريها بلطف على الوجه والرقبة مع تجنب منطقة العينين. يُستعمل صباحاً ومساءً.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKhVGdNj6jkm1wtzPe7Kjk9lp61F1Pgy-0tw&s', 1350.00, 2, '2026-04-25 23:04:59'),
(5, 'Dermactive Purifying Toner Niacinamide & Vitamin C 275ml', 'Dermactive Lotion Tonique (275ml)', 'تونر ديرماكتيف بالنياسيناميد و فيتامين C 275 مل', 'Purifying and brightening toner enriched with Niacinamide and Vitamin C. Helps regulate sebum and tighten pores for combination to oily skin.', 'C\'est une lotion tonique purifiante et éclaircissante, enrichie en Niacinamide et Vitamine C, idéale pour réguler le sébum et resserrer les pores des peaux mixtes à grasses.', 'تونر منقي ومفتح غني بالنياسيناميد وفيتامين C، يساعد على تنظيم إفراز الدهون وتضييق المسام، مناسب للبشرة المختلطة إلى الدهنية.', 'Apply morning and evening on clean skin using a cotton pad, gently tapping on face and neck before your usual skincare routine.', 'Appliquez matin et soir sur une peau propre à l\'aide d\'un coton, en tapotant légèrement sur le visage et le cou avant votre soin habituel.', 'يُستعمل صباحاً ومساءً على بشرة نظيفة باستخدام قطعة قطن، مع التربيت بلطف على الوجه والرقبة قبل روتين العناية.', 'https://kadisse.com/wp-content/uploads/2025/06/Dermactive-Lotion-Tonique-Absolue-Niacinamide-Vitamine-C-275-ml.webp', 1100.00, 2, '2026-04-25 23:11:47'),
(6, 'Dermactive Comfort Toner – Hydrating & Soothing 275ml', 'Dermactive Lotion Tonique Confort – Hydratante & Apaisante (275 ml)', 'لوسيون ديرماكتيف المهدئ والمرطب 275 مل', 'Hydrating and soothing toner designed to complete cleansing, calm irritation, and restore comfort to dry and sensitive skin.', 'Une lotion tonique hydratante et apaisante conçue pour parfaire le nettoyage, calmer les irritations et redonner du confort aux peaux sèches et sensibles.', 'لوسيون مرطب ومهدئ يساعد على إكمال تنظيف البشرة، يخفف التهيج ويمنح راحة للبشرة الجافة والحساسة', 'Apply morning and evening using a cotton pad on clean face and neck. Do not rinse.', 'Appliquer matin et soir à l’aide d’un coton sur le visage et le cou parfaitement nettoyés. Ne pas rincer.', 'يُستعمل صباحًا ومساءً باستخدام قطعة قطن على الوجه والرقبة بعد تنظيفهما جيدًا. لا يُشطف.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQf7LxaVnkhpqjh3I0mhagypaJr63UhhuCZaw&s', 1100.00, 2, '2026-04-26 20:04:41'),
(7, 'Dermactive Amino Acids & Green Tea Toner 275ml', 'Dermactive Lotion Tonique – Acides Aminés & Thé Verte 275 ml', 'لوسيون ديرماكتيف بالأحماض الأمينية والشاي الأخضر 275 مل', 'Hydrating and balancing toner enriched with amino acids and green tea, ideal for refreshing and toning normal skin.', 'C\'est une Lotion Tonique hydratante et équilibrante de 275 ml, enrichie en acides aminés et thé vert, idéale pour tonifier et rafraîchir les peaux normales.', 'لوسيون مرطب ومتوازن غني بالأحماض الأمينية والشاي الأخضر، مثالي لإنعاش وتوحيد توازن البشرة العادية', 'Apply morning and evening on a clean face using a cotton pad. Do not rinse.', 'Appliquez matin et soir sur un visage propre à l\'aide d\'un coton, sans rincer.', 'يُستخدم صباحًا ومساءً على وجه نظيف باستخدام قطعة قطن، دون شطف.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjCFY9_dxL03O3EY1x6Ss4In0B-4SiF4W9jg&s', 1100.00, 2, '2026-04-26 20:15:10'),
(8, 'Biotanys Niacinamide Toner 200ml', 'Biotanys Toner à la Niacinamide 200ml', 'تونر بيوتانيس بالنياسيناميد 200 مل', 'Balancing toner formulated to improve skin texture and refine pores thanks to niacinamide (vitamin B3).', 'Le Biotanys Toner à la Niacinamide est une lotion tonique équilibrante formulée pour améliorer visiblement la qualité du grain de peau. Grâce à la niacinamide (vitamine B3).', 'تونر متوازن يساعد على تحسين ملمس البشرة وتصغير المسام بفضل النياسيناميد (فيتامين B3)', 'Use morning and/or evening depending on your skin needs. For normal skin, evening use is often sufficient.', 'S\'utilise matin et/soir selon les besoins de votre peau. Pour une peau normale, une application le soir est souvent suffisante pour purifier la peau après la journée.', 'يُستخدم صباحًا و/أو مساءً حسب حاجة البشرة. للبشرة العادية يكفي استخدامه مساءً لتنقية البشرة بعد يوم طويل.', 'https://healthy-cos.com/uploads/5860/26/02/699036f9d92561402261771058937.webp', 1190.00, 2, '2026-04-26 20:29:43'),
(9, 'Touche Skincare Exfoliating & Hydrating Toner 200ml', 'Touché Skincare – Lotion Tonique Exfoliante & Hydratante 200ml', 'تونر توشي للعناية المقشر والمرطب 200 مل', 'Bi-active toner designed to complete cleansing while revitalizing the skin. Its balanced formula combines gentle exfoliation and deep hydration for a fresher, more radiant complexion.', 'La Lotion Tonique de Touché Skincare est un soin bi-actif conçu pour parfaire le nettoyage tout en revitalisant l\'épiderme. Sa formule équilibrée combine une action exfoliante douce et une hydratation intense pour un teint instantanément plus frais et éclatant.', 'تونر مزدوج الفعالية يكمل تنظيف البشرة وينشطها، يجمع بين تقشير لطيف وترطيب عميق لبشرة أكثر إشراقًا وانتعاشًا', 'Apply using a cotton pad over face and neck. Avoid eye area.', 'Passez un coton imbibé sur le visage et le cou (évitez les yeux).', 'يُمرر بواسطة قطعة قطن على الوجه والرقبة مع تجنب منطقة العين', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOAz9IIIsSKFRBFuA0qQUGCyqIZV8GIajRXQ&s', 2600.00, 2, '2026-04-26 21:59:41'),
(10, 'Maneva Madagascar Centella Cleansing Gel 125ml', 'Maneva Madagascar Centella Cleansing Gel 125ml', 'جل تنظيف مانيفا سنتيلا 125 مل', 'Facial cleanser inspired by Korean skincare, designed to deeply cleanse the skin without causing dryness or irritation.', 'Nettoyant pour le visage algérien, formulé en s’inspirant des produits coréens, conçu spécialement pour offrir un nettoyage en profondeur de la peau sans provoquer de sécheresse ni d’irritation.', 'غسول وجه مستوحى من العناية الكورية، ينظف البشرة بعمق دون أن يسبب جفاف أو تهيج', 'Wet face and hands with lukewarm water. Apply a small amount, lather gently, massage for 30–60 seconds, then rinse and pat dry.', 'Mouillage : Mouillez votre visage et vos mains avec de l’eau tiède. Appliquez une petite quantité, faites mousser, massez 30 à 60 secondes, puis rincez et séchez en tapotant.', 'بلل الوجه واليدين بماء فاتر، ضع كمية صغيرة، دلك بلطف لمدة 30 إلى 60 ثانية، ثم اشطف وجفف بالتربيت', 'https://hiind.net/media/catalog/product/cache/0db5f8b4f6c37c4f6bd4a645d2777464/w/h/whatsapp_image_2026-03-01_at_2.20.14_pm.jpeg', 100.00, 1, '2026-04-26 22:17:12'),
(11, 'Dermactive Brightening Vitamin C Serum 30ml', 'Dermactive Sérum Éclaircissant Vitamine C 30ml', 'سيروم ديرماكتيف للتفتيح بفيتامين C 30 مل', 'Intensive serum designed to brighten the complexion and correct pigmentation imperfections. Enriched with Vitamin C for skin radiance and tone correction.', 'Ce sérum est un soin intensif conçu pour redonner de l\'éclat au teint et corriger les imperfections pigmentaires. Sa formule riche en Vitamine C agit en profondeur pour unifier la peau.', 'سيروم مكثف لتفتيح البشرة وتصحيح التصبغات بفيتامين C لتوحيد اللون وإشراقة الوجه', 'Apply a few drops morning and/or evening on clean, dry face.', 'Appliquez quelques gouttes matin et/ou soir sur un visage propre et sec.', 'توضع بضع قطرات صباحًا و/أو مساءً على بشرة نظيفة وجافة', 'https://eg.jumia.is/unsafe/fit-in/680x680/filters:fill(white)/product/93/895194/1.jpg?1450', 1500.00, 3, '2026-04-26 22:32:18'),
(12, 'Proderma Marine Collagen Serum 30ml', 'Proderma Sérum Collagène Marin 30 ml', 'سيروم برو درما بالكولاجين البحري 30 مل', 'Intensive serum designed to restore skin youth, elasticity and reduce signs of aging. Its lightweight formula absorbs quickly into the skin.', 'Le sérum Proderma au collagène marin est un soin intensif conçu pour restaurer la jeunesse et l\'élasticité de la peau. Sa formule légère et fluide pénètre rapidement pour cibler les signes du vieillissement cutané.', 'سيروم مكثف بالكولاجين البحري يساعد على استرجاع شباب البشرة ومرونتها وتقليل علامات التقدم في السن', 'Apply 2–3 drops morning and evening on clean face, then gently massage before moisturizer.', 'Appliquez 2 à 3 gouttes matin et soir sur un visage propre, puis massez délicatement avant votre crème hydratante.', 'توضع 2 إلى 3 قطرات صباحًا ومساءً على بشرة نظيفة ثم تُدلك بلطف قبل وضع المرطب', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRhkRUOj81iNqbn82m6vJxtOKGnisK9vTDzzNVRL_N1rySpWG3_', 1600.00, 3, '2026-04-26 22:47:20'),
(13, 'Lisas Soft Hydrating Face Cream 75ml - Oily to Combination Skin', 'Lisas Soft Crème Hydratante Visage - Peaux Grasses à Mixtes 75ml', 'كريم ليساس المرطب للوجه - البشرة الدهنية والمختلطة 75 مل', 'Lightweight non-greasy face cream enriched with Jojoba oil and Vitamin E. It deeply hydrates the skin while regulating excess sebum, leaving the skin soft, fresh and shine-free.', 'Grâce à sa formule légère, non grasse et riche en huile de Jojoba et en Vitamine E, cette crème hydrate intensément votre peau tout en régulant l\'excès de sébum. Elle pénètre rapidement pour laisser votre visage doux, frais et sans brillance.', 'كريم خفيف غير دهني غني بزيت الجوجوبا وفيتامين E يرطب البشرة بعمق وينظم إفراز الدهون الزائدة ويترك الوجه ناعم ومنتعش بدون لمعان', 'Apply morning and evening on clean, dry face and neck. Massage gently until fully absorbed.', 'Appliquez la crème matin et soir sur une peau propre et sèche (visage et cou), en massant délicatement jusqu’à absorption complète.', 'يُوضع صباحًا ومساءً على بشرة نظيفة وجافة (الوجه والرقبة) مع التدليك بلطف حتى الامتصاص الكامل', 'https://laplace7.dz/public/uploads/all/qK8aHQcaCFPENsuae0w9601R7shGAjtzY9RfgTYD.webp', 350.00, 4, '2026-04-26 22:57:38'),
(14, 'Face Hydrating Cream Normal to Dry Skin 50ml', 'Crème Hydratante Visage (Peaux Normales à Sèches) 50ml', 'كريم مرطب للوجه للبشرة العادية إلى الجافة 50 مل', 'Hydrating face cream specially formulated for normal to dry skin. It deeply moisturizes the skin daily while respecting its sensitivity. Fragrance-free to reduce irritation risks.', 'Spécialement formulée pour les peaux normales à sèches, cette crème hydratante est conçue pour hydrater intensément la peau au quotidien tout en respectant sa sensibilité. Elle est formulée sans parfum pour minimiser les risques d\'irritation.', 'كريم مرطب مخصص للبشرة العادية إلى الجافة، يرطب البشرة بعمق يوميًا مع احترام حساسيتها، وخالٍ من العطور لتقليل التهيج', 'Apply morning and evening on clean, dry face and neck. Massage gently until fully absorbed.', 'Appliquez la crème matin et soir sur une peau propre et sèche (visage et cou), en massant délicatement jusqu’à absorption complète.', 'يُوضع صباحًا ومساءً على بشرة نظيفة وجافة (الوجه والرقبة) مع التدليك بلطف حتى الامتصاص الكامل', 'https://www.pharmaly-dz.com/wp-content/uploads/2025/03/lisas-soft-creme-hydratante-visage-peaux-normales-a-seches-75ml.webp', 350.00, 4, '2026-04-26 23:06:11'),
(15, 'Zorah Lightweight Day Face Cream Ultra Hydrating 85ml', 'Zorah Crème Visage Légère Jour Ultra Hydratante 85ml', 'كريم زوراه النهاري الخفيف المرطب بعمق 85 مل', 'Ultra-hydrating day cream with a light, non-greasy texture. Designed for all skin types.', 'C\'est une crème de jour ultra-hydratante à la texture fluide et non grasse. Elle convient à tous les types de peau.', 'كريم نهاري مرطب جدًا بقوام خفيف وغير دهني، مناسب لجميع أنواع البشرة', 'Apply a small amount on face and neck every morning.', 'Appliquez une noisette de crème sur le visage et le cou chaque matin.', 'يوضع مقدار صغير على الوجه والرقبة كل صباح', 'https://adibabeauty.com/cdn/shop/files/IMG-0700.jpg?v=1737653541', 850.00, 4, '2026-04-26 23:16:18'),
(16, 'Proderma Soft Hydrating Cream', 'Proderma Soft', 'برو درما سوفت كريم مرطب خفيف', 'A lightweight refreshing moisturizing cream that absorbs quickly without leaving a greasy film. Ideal for daily care of face, body, and hands.', 'Une crème hydratante légère et rafraîchissante qui pénètre rapidement sans laisser de film gras, idéale pour le soin quotidien du visage, du corps et des mains.', 'كريم مرطب خفيف ومنعش يمتص بسرعة دون ترك طبقة دهنية، مثالي للعناية اليومية بالوجه والجسم واليدين', 'Apply a small amount on clean face morning and evening, gently massaging until fully absorbed.', 'Appliquez une petite noisette sur un visage propre matin et soir, en massant délicatement jusqu\'à absorption complète.', 'يوضع مقدار صغير على وجه نظيف صباحًا ومساءً مع التدليك بلطف حتى الامتصاص الكامل', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDIea4_LZ-KfCB35F8pWm4EN0Yva_To1Wj0Q&s', 400.00, 4, '2026-04-26 23:26:42'),
(17, 'Venus Viderm Sebum-Regulating Face Cream 50ml', 'Venus Viderm – Crème Visage Sebum-Normalisante 50ml', 'فينوس فيدرم كريم تنظيم الزيوت للوجه 50 مل', 'Sebum-regulating face cream that deeply purifies the skin, reduces imperfections, and tightens pores for a clear and matte complexion.', 'Le soin Venus Viderm Acné Contrôle est une crème sébum-régulatrice qui purifie la peau en profondeur, élimine les imperfections et resserre les pores pour un teint net et matifié.', 'كريم ينظم إفراز الدهون وينقي البشرة بعمق ويقلل الشوائب ويصغر المسام للحصول على بشرة صافية ومطفية', 'Apply a small amount morning and evening on clean, dry face, avoiding the eye area.', 'Appliquez une noisette de crème matin et soir sur un visage parfaitement propre et sec, en évitant le contour des yeux.', 'يوضع مقدار صغير صباحًا ومساءً على بشرة نظيفة وجافة مع تجنب منطقة العين', 'https://pharmadigit.dz/wp-content/uploads/2021/11/image_produit-2-78.jpg', 380.00, 4, '2026-04-26 23:36:41'),
(18, 'Venus Viderm Anti-Dryness Hydrating Cream 150ml', 'Venus Viderm Crème Hydratante Anti-Dessèchement 150ml', 'فينوس فيدرم كريم مرطب ضد الجفاف 150 مل', 'Moisturizing and regenerating cream designed for dry, tired, or dehydrated skin. It restores the skin barrier, prevents early aging, and brings radiance to the complexion. Its light texture absorbs quickly without leaving a greasy film.', 'C\'est un soin hydratant et régénérant conçu pour les peaux sèches, fatiguées ou déshydratées. Grâce à sa richesse en actifs naturels, elle restaure le film hydrolipidique de la peau, prévient le vieillissement précoce et redonne de l\'éclat au teint. Sa texture fluide pénètre rapidement sans laisser de film gras.', 'كريم مرطب ومجدد مخصص للبشرة الجافة والمتعبة أو المصابة بالجفاف، يعيد حماية البشرة ويمنع الشيخوخة المبكرة ويمنح إشراقة للوجه', 'Apply morning and evening on clean face, gently massaging until fully absorbed.', 'Appliquez la crème matin et soir sur un visage propre, en massant délicatement jusqu’à absorption complète.', 'يوضع صباحًا ومساءً على بشرة نظيفة مع التدليك بلطف حتى الامتصاص الكامل', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSTZNB4UuH6lozjyDReUujviziV9xBdylEfEG4p69rj8IBsv0Nc', 350.00, 4, '2026-04-26 23:42:51'),
(19, 'BIOLILA Sunscreen SPF 50+ PA++++', 'BIOLILA Écran Solaire SPF 50+', 'واقي شمس بيوليا SPF 50+', 'High protection sunscreen SPF 50+ PA++++ with a very lightweight serum-like texture. It absorbs quickly without leaving white marks or greasy residue, ideal for daily use and as a makeup base.', 'Le nouvel écran solaire Biolila est un “écran total” offrant une protection maximale (SPF 50+ PA++++). Il se distingue par sa texture très légère, semblable à un sérum, qui pénètre rapidement dans la peau sans laisser de traces blanches ni de film gras.', 'واقي شمس بحماية عالية SPF 50+ قوامه خفيف مثل السيروم، يمتص بسرعة بدون آثار بيضاء أو ملمس دهني، مناسب للاستعمال اليومي وقبل المكياج', 'Apply a sufficient amount (two-finger rule) on face and neck 15–20 minutes before sun exposure. Reapply every 2 hours or after sweating/swimming. Use as last step of morning routine.', 'Appliquez une quantité suffisante (règle des deux doigts) sur le visage et le cou. À appliquer 15 à 20 minutes avant l\'exposition au soleil. Renouveler toutes les deux heures.', 'يوضع مقدار كافي (قاعدة الإصبعين) على الوجه والرقبة قبل التعرض للشمس بـ 15 إلى 20 دقيقة، ويعاد وضعه كل ساعتين أو بعد التعرق أو السباحة', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSkIu2rJjd792RaM0SrOsWKgV21g66VVVgK4VIz4FzOJ1MmDXbe', 115.00, 5, '2026-04-26 23:53:30'),
(20, 'Venus Viderm Invisible Sunscreen SPF 50+', 'Venus Viderm Solaire Écran Total Invisible SPF 50+', 'فينوس فيدرم واقي شمس شفاف SPF 50+', 'Very high protection sunscreen SPF 50+ designed to protect the skin from UVA and UVB rays. Its invisible formula is ultra-light, non-greasy, and leaves no white cast, making it suitable for all skin types, even sensitive skin.', 'C’est une crème solaire à très haute protection (SPF 50+) conçue pour protéger la peau des rayons UVA et UVB. Sa formule \"invisible\" est ultra-légère, non grasse et ne laisse aucune trace blanche sur le visage.', 'واقي شمس بحماية عالية جدًا SPF 50+ يحمي البشرة من أشعة UVA و UVB، بقوام خفيف غير دهني وشفاف بدون أي آثار بيضاء، مناسب لكل أنواع البشرة حتى الحساسة', 'Apply evenly on face 15 minutes before sun exposure. Reapply every 2 hours.', 'Appliquez la crème uniformément sur le visage 15 minutes avant l\'exposition au soleil et renouvelez l\'application toutes les deux heures.', 'يوضع بالتساوي على الوجه قبل التعرض للشمس بـ 15 دقيقة ويعاد كل ساعتين', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR5nvMtl-lA-z92fCE0avZbzZV1WolwjAT9fFGaxx1-BsHwQULn', 800.00, 5, '2026-04-27 00:03:56'),
(21, 'Lisas Sunscreen SPF 50+ Very High Protection', 'Lisas Crème Solaire Écran Total SPF 50+ Très Haute Protection', 'واقي شمس ليساس حماية عالية جدًا SPF 50+', 'Broad-spectrum sunscreen SPF 50+ offering very high protection against UVA and UVB rays. Enriched with Vitamin E and hydrating agents to prevent premature skin aging and dark spots.', 'La crème solaire Lisas Écran Total SPF 50+ est un soin protecteur à large spectre conçu pour offrir une très haute protection contre les rayons UVA et UVB. Sa formule riche en vitamine E et en agents hydratants aide à prévenir le vieillissement cutané prématuré et l\'apparition de taches brunes.', 'واقي شمس بحماية عالية جدًا SPF 50+ يحمي البشرة من أشعة UVA و UVB، غني بفيتامين E ومرطبات تساعد على منع الشيخوخة المبكرة وظهور البقع الداكنة', 'Apply a generous amount on face and neck 15–20 minutes before sun exposure. Reapply every 2 hours, especially after sweating, swimming or towel drying.', 'Appliquez une quantité généreuse sur le visage et le cou 15 à 20 minutes avant l\'exposition au soleil. Renouvelez l\'application toutes les 2 heures.', 'يوضع كمية كافية على الوجه والرقبة قبل التعرض للشمس بـ 15 إلى 20 دقيقة ويعاد كل ساعتين خاصة بعد التعرق أو السباحة', 'https://cosmeticstoredz.com/wp-content/uploads/2026/02/CC-84.png', 450.00, 5, '2026-04-27 00:04:23'),
(22, 'Biolila Cleansing Oil Rice & Tea Tree 180ml', 'Huile Nettoyante Biolila à l’Huile de Riz et à l’Huile d’Arbre à Thé 180ml', 'زيت تنظيف بيوليلة بزيت الأرز وشجرة الشاي 180 مل', 'Light cleansing oil inspired by Korean skincare that removes makeup, sunscreen and deep impurities. It transforms into a milky texture when in contact with water for easy rinsing without greasy residue.', 'Huile nettoyante légère, inspirée des rituels coréens, qui dissout le maquillage, la crème solaire et les impuretés. Elle se transforme en lait au contact de l’eau et se rince facilement sans laisser de film gras.', 'زيت تنظيف خفيف مستوحى من العناية الكورية يزيل المكياج وواقي الشمس والشوائب ويتحول إلى قوام حليبي عند ملامسة الماء بدون ترك دهون', 'Apply on dry skin, massage 1 minute, add water to emulsify, then rinse. Follow with a foaming cleanser (double cleansing routine).', 'Appliquer sur peau sèche, masser, ajouter de l’eau pour émulsionner puis rincer. Suivre avec un gel nettoyant.', 'يوضع على بشرة جافة، يدلك ثم يضاف الماء حتى يتحول لحليب ويشطف، ثم يستعمل غسول رغوي', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZVDUWWV_Zw4A6BnnwIMt64rpHABDF14LPXLw4BdeDTPiBwdL0', 145.00, 6, '2026-04-27 00:17:49'),
(23, 'Viderm Venus Micellar Water', 'Eau Micellaire Viderm Venus', 'ماء ميسيلار فيديرم فينوس', 'Gentle micellar water that removes makeup and impurities while respecting all skin types.', 'Eau micellaire douce qui élimine le maquillage et les impuretés tout en respectant tous les types de peau.', 'ماء ميسيلار لطيف يزيل المكياج والشوائب ويناسب جميع أنواع البشرة', 'Apply on a cotton pad and gently wipe face, no rinsing needed.', 'Appliquer sur un coton et nettoyer délicatement le visage sans rinçage.', 'يوضع على قطنة ويمسح الوجه بلطف بدون شطف', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXdQ4mjbyNo0NrZteyHnNBpif60suTJwHzng&s', 950.00, 7, '2026-04-27 00:43:10'),
(24, 'Maneva Centella Light Cleansing Oil 200ml', 'Huile Nettoyante Légère Maneva Centella 200ml', 'زيت تنظيف خفيف مانيفا سنتيلا 200 مل', 'Light cleansing oil with Centella Asiatica that removes makeup, sunscreen and excess sebum while soothing the skin.', 'Une huile démaquillante légère et purifiante, formulée à base de Centella Asiatica. Elle dissout le maquillage, les filtres solaires et l’excès de sébum tout en apaisant la peau.', 'زيت تنظيف خفيف يحتوي على سنتيلا يزيل المكياج وواقي الشمس والزيوت الزائدة مع تهدئة البشرة', 'Apply on dry face, massage 30 seconds, add water to emulsify, then rinse thoroughly.', 'Appliquez sur peau sèche, massez 30 secondes, ajoutez de l’eau pour émulsionner puis rincez.', 'يوضع على بشرة جافة، يدلك 30 ثانية، يضاف الماء ثم يشطف جيداً', 'https://hiind.net/media/catalog/product/cache/0db5f8b4f6c37c4f6bd4a645d2777464/w/h/whatsapp_image_2026-03-01_at_2.36.28_pm.jpeg', 1800.00, 6, '2026-04-27 08:26:47'),
(25, 'Maneva Madagascar Centella Serum 30ml', 'Sérum Maneva Madagascar Centella 30ml', 'سيروم مانيفا سنتيلا مدغشقر 30 مل', 'Soothing and repairing serum inspired by Korean skincare, ideal for irritated skin.', 'Produit algérien inspiré des techniques coréennes, conçu pour apaiser et réparer les peaux irritées.', 'سيروم مهدئ ومصلح للبشرة مستوحى من العناية الكورية، مناسب للبشرة المتهيجة', 'Apply a few drops on clean face, massage gently, then apply moisturizer. Use sunscreen in the morning.', 'Appliquer quelques gouttes sur le visage propre, masser puis appliquer une crème hydratante. Utiliser un écran solaire le matin.', 'يوضع بضع قطرات على بشرة نظيفة، يدلك بلطف ثم يوضع مرطب، مع واقي شمس صباحاً', 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcSPn5xHjOACtwiFAWiRLNsGKnjHXbbsPSodeuFIYq2y4laJHkTt', 850.00, 3, '2026-04-27 08:36:07'),
(26, 'Maneva Madagascar Centella Moisturizing Cream 50ml', 'Crème Hydratante Maneva Madagascar Centella 50ml', 'كريم مرطب مانيفا سنتيلا مدغشقر 50 مل', 'Hydrating and nourishing cream that helps repair the damaged skin barrier.', 'Crème hydratante et nourrissante conçue pour réparer la barrière cutanée endommagée.', 'كريم مرطب ومغذي يساعد على إصلاح حاجز البشرة المتضرر', 'Apply a small amount on clean face and neck, massage gently until fully absorbed. Use morning and evening.', 'Appliquer une petite quantité sur le visage et le cou propres, masser jusqu’à absorption complète. Utiliser matin et soir.', 'يوضع مقدار صغير على الوجه والرقبة ويدلك بلطف حتى الامتصاص. يستعمل صباحاً ومساءً', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVGBoRQH6RW9VU5NFq7FRBnxpHUfnW9c_jsg&s', 1000.00, 4, '2026-04-27 08:48:37'),
(27, 'Biolila Night Nourishing Cream Shea Butter 50ml', 'Crème nourrissante de nuit Biolila au beurre de karité 50 ml', 'كريم ليلي مغذي بيوليلة بزبدة الشيا 50 مل', 'Intensive night cream that helps regenerate and nourish the skin during sleep.', 'Cette crème de nuit est un soin intensif conçu pour régénérer la peau pendant le sommeil.', 'كريم ليلي مكثف يساعد على تجديد البشرة وتغذيتها أثناء النوم', 'Apply in the evening on clean skin before sleep, massage gently upward.', 'S’applique le soir avant le coucher sur une peau propre, masser de bas en haut.', 'يوضع مساءً قبل النوم على بشرة نظيفة مع تدليك لطيف من الأسفل إلى الأعلى', 'https://ho-parapharmacie.com/wp-content/uploads/2025/05/remove-background-project-32145661.png', 650.00, 4, '2026-04-27 09:01:02'),
(28, 'Biolila Eye Contour Cream', 'Crème contour des yeux Biolila', 'كريم محيط العين بيوليلة', 'Eye contour cream that hydrates deeply, reduces dark circles and fatigue signs while giving freshness.', 'Crème pour le contour des yeux qui hydrate en profondeur, illumine et réduit les cernes et signes de fatigue.', 'كريم لمحيط العين يرطب بعمق ويقلل الهالات وعلامات التعب ويمنح انتعاشاً', 'Apply a small amount around eyes, gently tap until absorbed. Use morning and evening.', 'Appliquer une petite quantité autour des yeux et tapoter délicatement jusqu’à absorption. Utiliser matin et soir.', 'يوضع مقدار صغير حول العين مع التربيت بلطف حتى الامتصاص. يستعمل صباحاً ومساءً', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZFSkHj1KOp8tat0Nw2smSNnUDl4JjvK4i7X7Ynuoh1dO3EBtT', 950.00, 5, '2026-04-27 09:04:17'),
(29, 'Biolila Night Nourishing Cream Shea Butter 50ml', 'Crème nourrissante de nuit Biolila au beurre de karité 50 ml', 'كريم ليلي مغذي بيوليلة بزبدة الشيا 50 مل', 'Intensive night cream that helps regenerate and nourish the skin during sleep.', 'Cette crème de nuit est un soin intensif conçu pour régénérer la peau pendant le sommeil.', 'كريم ليلي مكثف يساعد على تجديد البشرة وتغذيتها أثناء النوم', 'Apply in the evening on clean skin before sleep, massage gently upward.', 'S’applique le soir avant le coucher sur une peau propre, masser de bas en haut.', 'يوضع مساءً قبل النوم على بشرة نظيفة مع تدليك لطيف من الأسفل إلى الأعلى', 'https://ho-parapharmacie.com/wp-content/uploads/2025/05/remove-background-project-32145661.png', 650.00, 4, '2026-04-27 16:54:36'),
(30, 'Biolila Eye Contour Cream', 'Crème contour des yeux Biolila', 'كريم محيط العين بيوليلة', 'Eye contour cream that hydrates deeply, reduces dark circles and fatigue signs while giving freshness.', 'Crème pour le contour des yeux qui hydrate en profondeur, illumine et réduit les cernes et signes de fatigue.', 'كريم لمحيط العين يرطب بعمق ويقلل الهالات وعلامات التعب ويمنح انتعاشاً', 'Apply a small amount around eyes, gently tap until absorbed. Use morning and evening.', 'Appliquer une petite quantité autour des yeux et tapoter délicatement jusqu’à absorption. Utiliser matin et soir.', 'يوضع مقدار صغير حول العين مع التربيت بلطف حتى الامتصاص. يستعمل صباحاً ومساءً', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTZFSkHj1KOp8tat0Nw2smSNnUDl4JjvK4i7X7Ynuoh1dO3EBtT', 950.00, 10, '2026-04-27 16:56:02'),
(31, 'Calliderm Cucumber Face Scrub Exfoliant', 'Calliderm Soin Visage - Gommage Exfoliant Gourmand au Concombre', 'مقشر الوجه كاليديرم بالخيار', 'Refreshing and purifying face scrub that removes dead skin cells and impurities with gentle grains. Enriched with cucumber extract to deeply cleanse pores and leave the skin soft and radiant.', 'Un gommage \"Gourmand\" rafraîchissant et purifiant pour le visage, qui élimine les cellules mortes et les impuretés grâce à ses grains doux. Grâce à sa formule riche en extrait de concombre, il nettoie les pores en profondeur et laisse la peau douce avec un éclat immédiat.', 'مقشر منعش ومنقي للبشرة يزيل الخلايا الميتة والشوائب بفضل حبيباته اللطيفة، غني بخلاصة الخيار لتنظيف المسام وترك البشرة ناعمة ومشرقة', 'Apply on slightly damp face, massage gently in circular motions for 1–2 minutes, then rinse. Use 1–2 times per week and follow with moisturizer.', 'Appliquez sur peau légèrement humide, massez en mouvements circulaires pendant 1 à 2 minutes puis rincez. Utiliser 1 à 2 fois par semaine.', 'يوضع على بشرة رطبة قليلاً، يُدلك بحركات دائرية لمدة 1-2 دقيقة ثم يُشطف. يُستعمل مرة إلى مرتين أسبوعيًا مع وضع مرطب بعده', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLTPGev9WircsZ7EL9BEqer5YFkF0Wru-KGw&s', 500.00, 8, '2026-04-27 19:00:37'),
(32, 'MAKE Regenerating Cucumber Face Scrub', 'MAKE Gommage Visage Régénérant au Concombre', 'مقشر الوجه ميك بالخيار', 'Regenerating face scrub formulated to refresh and revitalize the skin. Enriched with cucumber extract, it gently removes impurities and dead skin cells while soothing the skin, leaving it smooth and ready for hydration.', 'Ce gommage est spécialement formulé pour revitaliser et rafraîchir le teint. Grâce aux extraits de concombre, il élimine en douceur les impuretés et les cellules mortes tout en apaisant l\'épiderme.', 'مقشر مخصص لتجديد وإنعاش البشرة، يحتوي على خلاصة الخيار لإزالة الشوائب والخلايا الميتة بلطف مع تهدئة البشرة وتركها ناعمة ومهيأة للترطيب', 'Apply on damp face, massage gently in circular motions for 2–3 minutes, then rinse. Use 1–2 times per week.', 'Appliquez sur visage humide, massez délicatement pendant 2 à 3 minutes puis rincez abondamment. Utiliser 1 à 2 fois par semaine.', 'يوضع على بشرة مبللة، يُدلك بلطف بحركات دائرية لمدة 2-3 دقائق ثم يُشطف جيدًا. يُستخدم مرة إلى مرتين أسبوعيًا', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcQMX9AM7VhekCkC7N30FAp6Z9dNT2qJ2jfhYwrb92uw26gkB3pw', 580.00, 8, '2026-04-27 19:01:43'),
(33, 'Dermactive Strawberry Soothing Face Scrub', 'Dermactive Gommage Visage Fraise Apaisant', 'مقشر الوجه ديرماكتيف بالفراولة', 'Soothing and regenerating face scrub that combines mechanical exfoliation with micro-grains and natural fruit extracts to cleanse and refresh the skin.', 'Le gommage visage Dermactive est un soin nettoyant et régénérant qui combine une exfoliation mécanique (grâce à ses micro-grains) et un soin naturel (extraits de fruits).', 'مقشر منظف ومجدد للبشرة يجمع بين التقشير بحبيبات دقيقة ومكونات طبيعية من الفواكه لتنقية البشرة', 'Apply a small amount on damp face, massage gently in circular motions for 1–2 minutes, then rinse thoroughly.', 'Appliquez une noisette sur un visage humide, massez délicatement pendant 1 à 2 minutes puis rincez abondamment.', 'يوضع على بشرة مبللة، يُدلك بلطف بحركات دائرية لمدة 1-2 دقيقة ثم يُشطف جيدًا', 'https://laplace7.dz/public/uploads/all/YxPnQnF7nqenGwwizFrf4SEDvJHXCZqr9w6HEV4j.webp', 500.00, 8, '2026-04-27 19:02:46'),
(34, 'Calliderm Cucumber Purifying Face Mask 125g', 'Masque purifiant visage au concombre Calliderm 125g', 'ماسك الوجه المنقي بالخيار كاليديرم 125غ', 'Purifying face mask enriched with cucumber extract and clay to deeply cleanse pores, remove excess sebum, and refresh the skin, leaving it radiant and revitalized.', 'Offrez à votre peau un soin revitalisant avec le Masque Purifiant Calliderm. Enrichi en extraits naturels de concombre et en argile, ce masque désincruste les pores, élimine l\'excès de sébum et purifie l\'épiderme en profondeur.', 'ماسك منقي للبشرة غني بخلاصة الخيار والطين، ينظف المسام بعمق ويزيل الزيوت الزائدة ويمنح البشرة إشراقة وانتعاش', 'Apply a thick, even layer on clean face and neck, leave for 7–10 minutes (up to 20 minutes if needed), then rinse with lukewarm water. Use 1–2 times per week.', 'Appliquez une couche épaisse sur visage propre, laissez agir 7 à 10 minutes puis rincez à l\'eau tiède.', 'يوضع طبقة سميكة على بشرة نظيفة ويُترك من 7 إلى 10 دقائق ثم يُشطف بالماء الفاتر، يُستخدم مرة إلى مرتين أسبوعيًا', 'https://laplace7.dz/public/uploads/all/n35iiQXk2mjxS7GNv6NNEAc3zusGYBm9p6zlO82J.webp', 500.00, 9, '2026-04-27 19:22:31'),
(35, 'Calliderm Apricot Exfoliating Face Scrub 125ml', 'Calliderm Gommage Exfoliant Gourmand à l\'Extrait d\'Abricot 125ml', 'مقشر الوجه كاليديرم بالمشمش 125 مل', 'Gentle exfoliating scrub that removes dead skin cells and impurities, refining skin texture and leaving it smooth and radiant.', 'Ce gommage exfolie la peau en douceur, élimine les cellules mortes et les impuretés pour affiner le grain de peau.', 'مقشر لطيف يزيل الخلايا الميتة والشوائب ويمنح البشرة نعومة ونقاء', 'Apply on damp face, massage gently in circular motions avoiding eye area, then rinse thoroughly. Use 1–2 times per week.', 'Appliquez une noisette sur visage humidifié, massez délicatement puis rincez abondamment.', 'يوضع على بشرة مبللة، يُدلك بلطف بحركات دائرية مع تجنب العينين ثم يُشطف جيدًا', 'https://adibabeauty.com/cdn/shop/files/rn-image_picker_lib_temp_d5a2db49-5c1e-4e19-aa91-6a1081bd6068.jpg?v=1704132153', 500.00, 8, '2026-04-27 19:24:00'),
(36, 'Calliderm Clay & Plant Purifying Face Mask 150ml', 'Calliderm Masque Purifiant à l\'Argile et aux Plantes 150 ml', 'ماسك كاليديرم المنقي بالطين والنباتات 150 مل', 'Deep purifying face mask enriched with clay and plant extracts that absorbs excess sebum and cleanses the skin for a fresh and clear complexion.', 'Ce masque à l\'argile et aux plantes purifie la peau en profondeur et absorbe l\'excès de sébum pour un teint frais et net.', 'ماسك منقي بالطين ومستخلصات النباتات ينظف البشرة بعمق ويمتص الزيوت الزائدة للحصول على بشرة نقية ومنتعشة', 'Apply a thick layer on clean, dry face, leave for 10–15 minutes until it dries, then rinse with lukewarm water. Use 1–2 times per week.', 'Appliquez une couche épaisse sur visage propre, laissez agir 10 à 15 minutes puis rincez abondamment.', 'يوضع طبقة سميكة على بشرة نظيفة ويُترك 10 إلى 15 دقيقة ثم يُشطف بالماء الفاتر، يُستخدم مرة إلى مرتين أسبوعيًا', 'https://adibabeauty.com/cdn/shop/files/IMG-8653.png?v=1704139901', 500.00, 9, '2026-04-27 19:25:00'),
(37, 'Dermactive Avocado Sheet Mask 25g', 'Dermactive Avocado Sheet Mask 25g', 'ماسك أفوكادو ديرماكتيف 25غ', 'Intensive sheet mask highly concentrated in serum, designed to deeply nourish and revitalize the skin, providing an instant boost of radiance and hydration.', 'Le masque Dermactive Avocado est un soin intensif hautement concentré en sérum, conçu pour offrir une revitalisation immédiate. Ce masque en tissu favorise la pénétration profonde des actifs dans l\'épiderme.', 'ماسك ورقي غني بالسيروم يمنح ترطيبًا عميقًا وانتعاشًا فوريًا للبشرة ويعزز إشراقتها وحيويتها', 'Apply on clean, dry face, leave for 15–20 minutes, remove and gently massage excess serum without rinsing.', 'Appliquez le masque sur visage propre, laissez agir 15 à 20 minutes puis retirez et massez l\'excès de sérum sans rincer.', 'يوضع على بشرة نظيفة ويُترك لمدة 15 إلى 20 دقيقة ثم يُزال مع تدليك السيروم المتبقي دون شطف', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQUUn3g7iIapNFCrkMIO9vZnSn7JSFr_YPpqxpDtQU4y2mSGHUE', 250.00, 9, '2026-04-27 19:29:47'),
(38, 'Proderma Moderm Ultra Hydrating Sunscreen SPF50 50ml', 'Proderma Moderm Crème Ultra Hydratante SPF50 50 ml', 'كريم برو درما موديرم المرطب مع واقي شمس SPF50 50 مل', '2-in-1 care combining maximum sun protection (SPF50) with daily hydration. Lightweight, non-greasy texture that absorbs quickly without leaving a white cast.', 'Il s’agit d’un écran total 2 en 1 offrant une protection solaire maximale tout en agissant comme une crème hydratante quotidienne. Texture légère et non grasse.', 'كريم 2 في 1 يوفر حماية شمسية قوية SPF50 مع ترطيب يومي للبشرة، بقوام خفيف وغير دهني', 'Apply 15–20 minutes before sun exposure on face and neck. Reapply every 2 hours or after swimming or sweating. Can be used as makeup base.', 'Appliquez 15 à 20 minutes avant exposition au soleil et renouvelez toutes les deux heures.', 'يوضع قبل التعرض للشمس بـ15 إلى 20 دقيقة ويعاد كل ساعتين أو بعد السباحة أو التعرق', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTw8yqLvfdQ2ACGohwqOu-l9GmBowXr0L788g&s', 950.00, 5, '2026-04-27 19:31:49'),
(39, 'Forever Skin Glow Foundation', 'Fond de teint Forever Skin Glow', 'كريم أساس فوريفر سكين جلو', 'Glow foundation with natural radiant finish and medium coverage.', 'Fond de teint lumineux avec une couvrance moyenne et un fini naturel.', 'كريم أساس بلمعة طبيعية وتغطية متوسطة.', 'Apply evenly using a makeup sponge or brush.', 'Appliquer uniformément avec une éponge ou un pinceau.', 'يوزع بالتساوي باستعمال إسفنجة أو فرشاة مكياج.', 'https://pickedmakeup.com/wp-content/uploads/2026/04/img_3969-1-400x500.png', 1300.00, NULL, '2026-05-07 21:28:13'),
(40, 'Matte Foundation Picked Makeup', 'Fond de teint mat Picked Makeup', 'كريم أساس مات من Picked Makeup', 'Matte foundation with 3 levels of coverage for a smooth natural finish.', 'Fond de teint mat avec 3 niveaux de couvrance pour un fini naturel et lisse.', 'كريم أساس مطفي بثلاث درجات تغطية يعطي لمسة طبيعية وناعمة.', 'Apply evenly on face using sponge or brush. Build coverage as needed.', 'Appliquer uniformément avec une éponge ou un pinceau. Ajuster la couvrance selon le besoin.', 'يوضع بالتساوي على الوجه باستعمال إسفنجة أو فرشاة ويمكن زيادة التغطية حسب الرغبة.', 'https://static.wixstatic.com/media/d2760b_d7324468d2874528974fc8feef026f26~mv2.jpeg/v1/fill/w_980,h_1225,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/d2760b_d7324468d2874528974fc8feef026f26~mv2.jpeg', 1280.00, NULL, '2026-05-07 21:37:04'),
(41, 'Concealer Shape Tope Picked', 'Correcteur Shape Tope Picked', 'كونسيلر Shape Tope Picked', 'High coverage concealer for dark circles and imperfections with smooth finish.', 'Correcteur haute couvrance pour cernes et imperfections avec fini lisse.', 'كونسيلر عالي التغطية للهالات السوداء والعيوب بلمسة ناعمة.', 'Apply under eyes or on spots, then blend with sponge or fingers.', 'Appliquer sous les yeux ou sur les imperfections, puis estomper.', 'يوضع تحت العين أو على الحبوب ثم يُدمج بالإسفنجة أو بالأصابع.', 'https://pickedmakeup.com/wp-content/uploads/2026/03/picked-05-2-1-683x1024.png', 700.00, NULL, '2026-05-07 21:51:23'),
(42, 'Setting Loose Powder Picked', 'Poudre libre fixante Picked', 'بودرة تثبيت ناعمة من Picked', 'Lightweight loose setting powder that mattifies the skin and sets makeup for long wear.', 'Poudre libre légère qui matifie la peau et fixe le maquillage pour une longue tenue.', 'بودرة خفيفة تثبت المكياج وتعطي لمسة مطفية وتدوم طويلاً.', 'Apply lightly with a brush or puff on face after foundation.', 'Appliquer légèrement avec un pinceau ou une houppette après le fond de teint.', 'توضع بخفة بفرشاة أو إسفنجة بعد كريم الأساس لتثبيت المكياج.', 'https://pickedmakeup.com/wp-content/uploads/2025/10/1000002121.png', 800.00, NULL, '2026-05-07 21:57:54'),
(43, 'Primer Picked Makeup', 'Base de maquillage Picked Makeup', 'برايمر من Picked Makeup', 'Smoothing makeup primer that prepares the skin for foundation and improves makeup longevity.', 'Base de maquillage lissante qui prépare la peau au fond de teint et améliore la tenue du maquillage.', 'برايمر يجهز البشرة قبل كريم الأساس ويخلي المكياج يدوم أطول.', 'Apply a small amount on clean skin before foundation.', 'Appliquer une petite quantité sur peau propre avant le fond de teint.', 'يوضع كمية صغيرة على بشرة نظيفة قبل كريم الأساس.', 'https://pickedmakeup.com/wp-content/uploads/2025/09/6-3.png', 1200.00, NULL, '2026-05-07 22:01:19'),
(46, 'Press Refresh Setting Spray', 'Spray fixateur Press Refresh', 'سبراي تثبيت المكياج Press Refresh', 'Setting spray that locks makeup in place and gives a fresh long-lasting finish.', 'Spray fixateur qui maintient le maquillage et donne un fini frais et longue tenue.', 'سبراي تثبيت يحافظ على المكياج ويعطي لمسة منعشة تدوم طويلاً.', 'Spray evenly on face after completing makeup.', 'Vaporiser uniformément sur le visage après le maquillage.', 'يرش على الوجه بالتساوي بعد الانتهاء من المكياج.', 'https://static.wixstatic.com/media/d2760b_d0c562f1e92c4c429ab0ceaeb5a2621b~mv2.jpg', 680.00, NULL, '2026-05-07 23:10:49'),
(47, 'Liquid Blush 2in1 Picked', 'Blush liquide 2 en 1 Picked', 'بلاشر سائل 2 في 1 من Picked', 'Liquid blush for cheeks and lips with a soft natural finish.', 'Blush liquide pour les joues et les lèvres avec un fini naturel.', 'بلاشر سائل للخدود والشفاه بلمسة طبيعية ناعمة.', 'Apply small dots on cheeks or lips then blend gently.', 'Appliquer quelques points puis estomper délicatement.', 'يوضع على الخدود أو الشفاه ثم يدمج بلطف.', 'https://pickedmakeup.com/wp-content/uploads/2025/10/1000004387.png', 370.00, NULL, '2026-05-07 23:16:32'),
(49, 'Magic Blush Picked', 'Magic Blush Picked', 'بلاشر ماجيك من Picked', 'Color-changing blush that gives cheeks a natural rosy glow.', 'Blush changeant qui donne un effet rosé naturel aux joues.', 'بلاشر يتغير لونه ويعطي الخدود لون وردي طبيعي.', 'Apply a small amount on cheeks and blend gently.', 'Appliquer une petite quantité sur les joues puis estomper.', 'توضع كمية صغيرة على الخدود ثم تدمج بلطف.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTSSLdtelypblrPxeHip3o4kWf6mvkjU3D6XQ&s', 650.00, NULL, '2026-05-07 23:29:28'),
(50, 'Big Eye 3D Mascara', 'Mascara Big Eye 3D', 'ماسكارا Big Eye 3D', 'Volumizing and lengthening mascara for bold 3D lashes.', 'Mascara volumisant et allongeant pour des cils effet 3D.', 'ماسكارا لتكثيف وتطويل الرموش بتأثير ثلاثي الأبعاد.', 'Apply from the roots to the tips of lashes using zigzag motions.', 'Appliquer de la racine jusqu’aux pointes avec un mouvement en zigzag.', 'توضع من جذور الرموش حتى الأطراف بحركة متعرجة.', 'https://pickedmakeup.com/wp-content/uploads/2025/10/WhatsApp-Image-2025-10-05-at-8.41.31-AM-1-400x500.jpeg', 350.00, NULL, '2026-05-07 23:48:41'),
(51, 'BB Mascara Picked', 'Mascara BB Picked', 'ماسكارا BB من Picked', 'Lightweight mascara that adds volume and definition for everyday lashes.', 'Mascara légère qui donne du volume et définit les cils pour un usage quotidien.', 'ماسكارا خفيفة تمنح الرموش كثافة وتحديدًا لإطلالة يومية.', 'Apply evenly from lash roots to tips for a natural volumized look.', 'Appliquer uniformément de la racine jusqu’aux pointes pour un effet naturel.', 'توضع بالتساوي من جذور الرموش حتى الأطراف للحصول على مظهر طبيعي وكثيف.', 'https://pickedmakeup.com/wp-content/uploads/2025/10/WhatsApp-Image-2025-10-05-at-8.41.26-AM-819x1024.jpeg', 350.00, NULL, '2026-05-08 14:57:53'),
(52, 'Gel Mascara Picked', 'Mascara Gel Picked', 'ماسكارا جل من Picked', 'Transparent gel mascara that defines lashes naturally and keeps them neat all day.', 'Mascara gel transparent qui définit naturellement les cils et les maintient en place toute la journée.', 'ماسكارا جل شفافة تمنح الرموش تحديدًا طبيعيًا وتحافظ على ترتيبها طوال اليوم.', 'Apply gently to lashes from roots to tips for a clean and natural look.', 'Appliquer délicatement des racines jusqu’aux pointes pour un effet naturel.', 'توضع بلطف من جذور الرموش حتى الأطراف للحصول على مظهر طبيعي.', 'https://pickedmakeup.com/wp-content/uploads/2025/12/1000002087-1638x2048.jpg', 210.00, NULL, '2026-05-08 15:01:03'),
(53, 'Eyeliner Pen Picked', 'Eyeliner Pen Picked', 'قلم آيلاينر من Picked', 'Precise eyeliner pen with intense black color for smooth and long-lasting lines.', 'Eyeliner feutre précis avec une couleur noire intense pour un tracé longue tenue.', 'قلم آيلاينر دقيق بلون أسود قوي لرسم خطوط ناعمة وثابتة.', 'Draw a line along the lash line starting from the inner corner outward.', 'Tracer une ligne le long des cils de l’intérieur vers l’extérieur.', 'ارسمي خطًا بمحاذاة الرموش من الزاوية الداخلية إلى الخارجية.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQI4Ca9bvXd7axGAacAAO3cg68c1MlFhYq0A&s', 650.00, NULL, '2026-05-08 15:03:18'),
(54, 'Vitamin C Glossy Lip Oil', 'Huile à lèvres glossy Vitamine C', 'زيت شفاه لامع بفيتامين C', 'Glossy lip oil enriched with Vitamin C for hydrated, soft, and shiny lips.', 'Huile à lèvres brillante enrichie en Vitamine C pour des lèvres douces et hydratées.', 'زيت شفاه لامع غني بفيتامين C يمنح الشفاه ترطيبًا ولمعانًا ونعومة.', 'Apply directly on lips whenever needed for hydration and shine.', 'Appliquer directement sur les lèvres pour hydrater et faire briller.', 'يوضع مباشرة على الشفاه عند الحاجة للترطيب واللمعان.', 'https://pickedmakeup.com/wp-content/uploads/2025/10/1000004184-400x500.png', 380.00, NULL, '2026-05-08 15:06:19'),
(55, 'Honey Infused Lip Oil Picked', 'Huile à lèvres au miel Picked', 'زيت شفاه بالعسل من Picked', 'Nourishing lip oil infused with honey to moisturize and give lips a glossy finish.', 'Huile à lèvres nourrissante enrichie au miel pour hydrater et faire briller les lèvres.', 'زيت شفاه مغذي بالعسل يمنح الشفاه ترطيبًا ولمعانًا جذابًا.', 'Apply evenly on clean lips for hydration and natural shine.', 'Appliquer uniformément sur des lèvres propres pour hydrater et faire briller.', 'يوضع بالتساوي على الشفاه النظيفة للترطيب واللمعان الطبيعي.', 'https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTO5nH5AVK6mJYEWrjAVIyjt-sv_3MG5kmEFwdp4Hn05jFV1yad', 490.00, NULL, '2026-05-08 15:55:59'),
(56, 'Glasting Color Gloss Picked', 'Gloss coloré Glasting Picked', 'غلوس ملون Glasting من Picked', 'Shiny color gloss that gives lips a smooth texture and radiant finish.', 'Gloss brillant qui donne aux lèvres une texture lisse et un fini éclatant.', 'غلوس لامع يمنح الشفاه لونًا جذابًا ولمسة ناعمة ومشرقة.', 'Apply directly to lips using the applicator for a glossy look.', 'Appliquer directement sur les lèvres avec l’applicateur pour un effet brillant.', 'يوضع مباشرة على الشفاه باستخدام الأداة للحصول على لمعان جذاب.', 'https://pickedmakeup.com/wp-content/uploads/2026/01/img_0065-400x500.jpeg', 450.00, NULL, '2026-05-08 15:57:05'),
(57, 'Collagen Lip Plumper Picked', 'Repulpant lèvres au collagène Picked', 'مكبر شفاه بالكولاجين من Picked', 'Collagen-infused lip plumper that enhances lip volume with a glossy finish.', 'Repulpant pour les lèvres enrichi au collagène pour un effet volumineux et brillant.', 'مكبر شفاه غني بالكولاجين يمنح الشفاه مظهرًا ممتلئًا ولامعًا.', 'Apply evenly on lips for an instant plumping and glossy effect.', 'Appliquer uniformément sur les lèvres pour un effet repulpant immédiat.', 'يوضع بالتساوي على الشفاه للحصول على مظهر ممتلئ ولامع.', 'https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcT9f3zK4rOrxD0Lw6QL-zrw7ZhRtcPBUlz2spJdq1_K53JsfJfo', 490.00, NULL, '2026-05-08 15:58:53');
INSERT INTO `products` (`id`, `name_en`, `name_fr`, `name_ar`, `description_en`, `description_fr`, `description_ar`, `how_to_use_en`, `how_to_use_fr`, `how_to_use_ar`, `image`, `price`, `step_id`, `created_at`) VALUES
(58, 'Picked Makeup Brush Collection', 'Collection de pinceaux maquillage Picked', 'مجموعة فرش مكياج من Picked', 'Complete makeup brush collection designed for smooth and professional makeup application.', 'Collection complète de pinceaux pour un maquillage précis et professionnel.', 'مجموعة متكاملة من فرش المكياج لتطبيق احترافي وناعم.', 'Use each brush for applying foundation, powder, blush, eyeshadow, and other makeup products.', 'Utiliser chaque pinceau pour appliquer le fond de teint, la poudre, le blush et les ombres à paupières.', 'تُستخدم الفرش لتطبيق كريم الأساس والبودرة والبلاشر وظلال العيون ومنتجات المكياج الأخرى.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQnMFGCLftC5bU6IZSfXu5Sutr89hC9FhA4UQ&s', 1150.00, NULL, '2026-05-08 15:59:32'),
(59, 'Beauty Blender Picked', 'Éponge maquillage Picked', 'إسفنجة مكياج من Picked', 'Soft makeup sponge designed for smooth and even foundation blending.', 'Éponge de maquillage douce conçue pour estomper le fond de teint uniformément.', 'إسفنجة مكياج ناعمة مخصصة لدمج كريم الأساس بشكل متساوٍ واحترافي.', 'Dampen the sponge before use and blend makeup using tapping motions.', 'Humidifier l’éponge avant utilisation puis estomper le maquillage par tapotements.', 'تُبلل الإسفنجة قبل الاستعمال ثم يُدمج المكياج بحركات خفيفة.', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS15dyWcPluasFhpb-jn-oLOxZt_5xjkbqW0Q&s', 450.00, NULL, '2026-05-08 16:00:43'),
(60, 'Hair Glow Hyaluronic Acid Shampoo - Habba Saouda', 'Shampooing Hair Glow à l’Acide Hyaluronique - Habba Saouda', 'شامبو Hair Glow بحمض الهيالورونيك وحبة السوداء', 'Hydrating shampoo enriched with hyaluronic acid and black seed to nourish and strengthen hair.', 'Shampooing hydratant enrichi à l’acide hyaluronique et à la habba saouda pour nourrir et renforcer les cheveux.', 'شامبو مرطب غني بحمض الهيالورونيك وحبة السوداء لتغذية وتقوية الشعر.', 'Apply on wet hair, massage gently into the scalp, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, masser délicatement puis rincer abondamment.', 'يوضع على الشعر المبلل مع التدليك بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2026/02/3D_Shampoo_Habba-saouda-300x300.png', 0.00, NULL, '2026-05-08 20:49:33'),
(61, 'Hair Glow Hyaluronic Acid Conditioner - Habba Saouda', 'Après-shampooing Hair Glow à l’Acide Hyaluronique - Habba Saouda', 'بلسم Hair Glow بحمض الهيالورونيك وحبة السوداء', 'Nourishing conditioner enriched with hyaluronic acid and black seed to soften and revitalize hair.', 'Après-shampooing nourrissant enrichi à l’acide hyaluronique et à la habba saouda pour adoucir et revitaliser les cheveux.', 'بلسم مغذي غني بحمض الهيالورونيك وحبة السوداء لتنعيم الشعر وتجديده.', 'Apply to clean wet hair after shampooing, leave for a few minutes, then rinse thoroughly.', 'Appliquer sur cheveux propres et mouillés après le shampooing, laisser quelques minutes puis rincer.', 'يوضع على الشعر النظيف والمبلل بعد الشامبو ويترك لبضع دقائق ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2026/02/3D_apres-shampoo_Habba-saouda-300x300.png', 0.00, NULL, '2026-05-08 20:57:51'),
(62, 'Hair Color Protective Shampoo - Hyaluronic Acid', 'Shampooing Protecteur Hair Color à l’Acide Hyaluronique', 'شامبو Hair Color الواقي بحمض الهيالورونيك', 'Protective shampoo formulated with hyaluronic acid to preserve colored hair and maintain shine.', 'Shampooing protecteur formulé à l’acide hyaluronique pour préserver la couleur et la brillance des cheveux.', 'شامبو واقٍ بحمض الهيالورونيك للحفاظ على لون ولمعان الشعر المصبوغ.', 'Apply on wet hair, massage gently, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, masser délicatement puis rincer abondamment.', 'يوضع على الشعر المبلل مع التدليك بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/3D_Shampoo_Hair-Color-300x300.png', 0.00, NULL, '2026-05-08 21:02:45'),
(63, 'Hair Restore Reconstructing Shampoo - Hyaluronic Acid', 'Shampooing Reconstructeur Hair Restore à l’Acide Hyaluronique', 'شامبو Hair Restore المعيد للبناء بحمض الهيالورونيك', 'Reconstructing shampoo enriched with hyaluronic acid to repair damaged hair and restore strength.', 'Shampooing reconstructeur enrichi à l’acide hyaluronique pour réparer et renforcer les cheveux abîmés.', 'شامبو معيد للبناء غني بحمض الهيالورونيك لإصلاح وتقوية الشعر التالف.', 'Apply on wet hair, massage gently into the scalp, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, masser délicatement puis rincer abondamment.', 'يوضع على الشعر المبلل مع التدليك بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/3D_Shampoo_Ceramide-300x300.png', 0.00, NULL, '2026-05-08 21:04:17'),
(64, 'Hair Protect Purple Shampoo - Hyaluronic Acid', 'Shampooing Déjaunisseur Hair Protect à l’Acide Hyaluronique', 'شامبو Hair Protect البنفسجي بحمض الهيالورونيك', 'Purple shampoo enriched with hyaluronic acid to neutralize yellow tones and protect blonde or gray hair.', 'Shampooing violet enrichi à l’acide hyaluronique pour neutraliser les reflets jaunes et protéger les cheveux blonds ou gris.', 'شامبو بنفسجي غني بحمض الهيالورونيك لإزالة الاصفرار وحماية الشعر الأشقر أو الرمادي.', 'Apply on wet hair, leave for a few minutes, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, laisser agir quelques minutes puis rincer abondamment.', 'يوضع على الشعر المبلل ويترك لبضع دقائق ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/3D_Shampoo_Violet-300x300.png', 0.00, NULL, '2026-05-08 21:06:17'),
(65, 'Botanical Touch Shampoo - Cress Seeds & Moringa', 'Shampooing Botanical Touch - Grains de Cresson et Moringa', 'شامبو Botanical Touch بحبوب الرشاد والمورينغا', 'Botanical shampoo enriched with cress seeds and moringa to nourish, strengthen, and revitalize hair.', 'Shampooing botanique enrichi en grains de cresson et moringa pour nourrir et revitaliser les cheveux.', 'شامبو نباتي غني بحبوب الرشاد والمورينغا لتغذية وتقوية الشعر واستعادة حيويته.', 'Apply on wet hair, massage gently into the scalp, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, masser délicatement puis rincer abondamment.', 'يوضع على الشعر المبلل مع تدليك فروة الرأس بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2023/11/2-Shampoing-Botanical-Touch-Shampooing-grains-de-cresson-et-moringa-300x300.png', 0.00, NULL, '2026-05-08 21:08:08'),
(66, 'Family Garlic Shampoo', 'Shampooing Family à l’Ail', 'شامبو فاميلي بالثوم', 'Family shampoo enriched with garlic extract and keratin to strengthen hair, reduce hair fall, and add shine.', 'Shampooing familial enrichi à l’extrait d’ail et à la kératine pour renforcer les cheveux et réduire leur chute.', 'شامبو عائلي غني بخلاصة الثوم والكيراتين لتقوية الشعر وتقليل التساقط ومنحه لمعانًا.', 'Apply on wet hair, massage gently into the scalp, then rinse thoroughly.', 'Appliquer sur cheveux mouillés, masser délicatement puis rincer abondamment.', 'يوضع على الشعر المبلل مع تدليك فروة الرأس بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2022/10/Web_Shaampoo_Family_Lychee-02-300x300.png', 0.00, NULL, '2026-05-08 21:10:25'),
(67, 'Hair Restore Reconstructing Mask - Hyaluronic Acid', 'Masque Reconstructeur Hair Restore à l’Acide Hyaluronique', 'ماسك Hair Restore المعيد للبناء بحمض الهيالورونيك', 'Reconstructing hair mask enriched with hyaluronic acid to deeply nourish and repair damaged hair.', 'Masque reconstructeur enrichi à l’acide hyaluronique pour nourrir et réparer intensément les cheveux abîmés.', 'ماسك معيد للبناء غني بحمض الهيالورونيك لتغذية وإصلاح الشعر التالف بعمق.', 'Apply on clean damp hair, leave for 5 to 10 minutes, then rinse thoroughly.', 'Appliquer sur cheveux propres et humides, laisser agir 5 à 10 minutes puis rincer abondamment.', 'يوضع على الشعر النظيف والرطب ويترك من 5 إلى 10 دقائق ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/3D_Masque_Ceramide-300x300.png', 0.00, NULL, '2026-05-08 21:12:21'),
(68, 'Gloss Serum', 'Sérum Gloss', 'سيروم جلوس للشعر', 'Shine-enhancing hair serum that smooths frizz and leaves hair silky and glossy.', 'Sérum capillaire brillant qui lisse les frisottis et apporte douceur et brillance.', 'سيروم للشعر يمنح لمعانًا فائقًا ويقلل الهيشان ليترك الشعر ناعمًا ولامعًا.', 'Apply a small amount on dry or damp hair, focusing on lengths and ends.', 'Appliquer une petite quantité sur cheveux secs ou humides en insistant sur les longueurs.', 'توضع كمية صغيرة على الشعر الجاف أو الرطب مع التركيز على الأطراف.', 'https://laboratoiresvenus.com/wp-content/uploads/2023/11/1-serum-CHX-COLORES-.557-300x300.png', 0.00, NULL, '2026-05-08 21:13:27'),
(69, 'Shower Gel with Rose Petals - Eden Garden Frangipani', 'Gel douche aux pétales de roses - Eden Garden Frangipanier', 'جل استحمام ببتلات الورد - Eden Garden فرانجيباني', 'Gentle shower gel enriched with rose petals for soft and fresh skin.', 'Gel douche doux enrichi aux pétales de roses pour une peau douce et fraîche.', 'جل استحمام لطيف غني ببتلات الورد لبشرة ناعمة ومنعشة.', 'Apply on wet skin, massage gently then rinse with water.', 'Appliquer sur peau mouillée, masser délicatement puis rincer à l’eau.', 'يوضع على بشرة مبللة مع التدليك بلطف ثم يشطف بالماء.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/Gel-douche_EDEN_Frangipanier-300x300.png', 0.00, NULL, '2026-05-08 21:37:54'),
(70, 'Shower Gel Fun Relaxing', 'Gel douche Fun Relaxing', 'جل استحمام Fun Relaxing', 'Relaxing shower gel that gently cleanses the skin and leaves a fresh scent.', 'Gel douche relaxant qui nettoie doucement la peau et laisse un parfum frais.', 'جل استحمام مريح ينظف البشرة بلطف ويترك رائحة منعشة.', 'Apply on wet skin, massage gently, then rinse thoroughly.', 'Appliquer sur peau mouillée, masser délicatement puis rincer abondamment.', 'يوضع على بشرة مبللة، يدلك بلطف ثم يشطف جيدًا.', 'https://laboratoiresvenus.com/wp-content/uploads/2021/06/Web_Gel_Douche_Naturelles_-300x300.png', 0.00, NULL, '2026-05-08 21:40:39'),
(71, 'Deodorant Pure & Fresh Antibacterial Lemon', 'Déodorant Pure & Fresh antibactérien citron', 'مزيل عرق Pure & Fresh مضاد للبكتيريا بالليمون', 'Antibacterial deodorant with a fresh lemon scent that keeps underarms fresh all day.', 'Déodorant antibactérien au parfum citron frais qui garde les aisselles fraîches toute la journée.', 'مزيل عرق مضاد للبكتيريا برائحة الليمون المنعشة يحافظ على انتعاش الإبط طوال اليوم.', 'Apply on clean and dry underarms.', 'Appliquer sur des aisselles propres et sèches.', 'يوضع على إبطي نظيف وجاف.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/07/Deo_PURE_Fresh-300x300.png', 0.00, NULL, '2026-05-08 21:42:34'),
(72, 'Deodorant Pure & Natural Antibacterial Exotic Fruit', 'Déodorant Pure & Natural antibactérien fruits exotiques', 'مزيل عرق Pure & Natural مضاد للبكتيريا برائحة الفواكه الاستوائية', 'Antibacterial deodorant with exotic fruit fragrance that keeps you fresh all day.', 'Déodorant antibactérien au parfum de fruits exotiques pour une fraîcheur longue durée.', 'مزيل عرق مضاد للبكتيريا برائحة الفواكه الاستوائية يمنحك انتعاش طوال اليوم.', 'Apply on clean and dry underarms.', 'Appliquer sur des aisselles propres et sèches.', 'يوضع على إبطي نظيف وجاف.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/07/Deo_PURE_Natural-300x300.png', 0.00, NULL, '2026-05-08 21:46:09'),
(73, 'Deodorant Pure & Protect Antibacterial Cucumber', 'Déodorant Pure & Protect antibactérien concombre', 'مزيل عرق Pure & Protect مضاد للبكتيريا بالخيار', 'Antibacterial deodorant with cucumber extract that protects and refreshes the skin all day.', 'Déodorant antibactérien à l’extrait de concombre qui protège et rafraîchit la peau toute la journée.', 'مزيل عرق مضاد للبكتيريا بخلاصة الخيار يحمي وينعش البشرة طوال اليوم.', 'Apply on clean and dry underarms.', 'Appliquer sur des aisselles propres et sèches.', 'يوضع على إبطي نظيف وجاف.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/07/Deo_PURE_Protect-1-300x300.png', 0.00, NULL, '2026-05-08 21:48:37'),
(74, 'Deo Roll On Fabulous', 'Déodorant Roll-On Fabulous', 'مزيل عرق رول أون Fabulous', 'Roll-on deodorant that provides long-lasting freshness and protection.', 'Déodorant roll-on offrant une fraîcheur et une protection longue durée.', 'مزيل عرق رول أون يمنح انتعاش وحماية تدوم طويلاً.', 'Apply on clean and dry underarms.', 'Appliquer sur des aisselles propres et sèches.', 'يوضع على إبطي نظيف وجاف.', 'https://laboratoiresvenus.com/wp-content/uploads/2025/05/Roll-on-6-300x300.png', 0.00, NULL, '2026-05-08 21:50:40'),
(75, 'Evoria Hair & Body Mist Baby Blue 100ml', 'Brume cheveux et corps Evoria Baby Blue 100ml', 'بخاخ للشعر والجسم Evoria Baby Blue 100مل', 'Fragrant mist for hair and body that refreshes and leaves a soft baby blue scent.', 'Brume parfumée pour cheveux et corps qui rafraîchit et laisse un parfum doux Baby Blue.', 'بخاخ معطر للشعر والجسم يمنح انتعاش ورائحة ناعمة Baby Blue.', 'Spray on hair and body from a short distance.', 'Vaporiser sur les cheveux et le corps à courte distance.', 'يرش على الشعر والجسم من مسافة قصيرة.', 'https://cosmeticstoredz.com/wp-content/uploads/2026/02/CC-22-3.png', 550.00, NULL, '2026-05-08 21:52:33'),
(76, 'Baby Powder Body Gel Rose 800ml', 'Gel corps Baby Powder Rose 800ml', 'جل للجسم Baby Powder برائحة الورد 800مل', 'Body gel with baby powder and rose scent that leaves skin soft and fresh.', 'Gel corps au parfum de poudre de bébé et rose qui laisse la peau douce et fraîche.', 'جل للجسم برائحة بودرة الأطفال والورد يمنح نعومة وانتعاش للبشرة.', 'Apply on clean skin and massage until absorbed.', 'Appliquer sur peau propre et masser jusqu’à absorption.', 'يوضع على بشرة نظيفة ويدلك حتى الامتصاص.', 'https://cosmeticstoredz.com/wp-content/uploads/2026/02/CC-116-2.png', 720.00, NULL, '2026-05-08 21:53:58'),
(77, 'Baby Powder Body Lotion Mauve 400ml', 'Lait corporel Baby Powder Mauve 400ml', 'لوشن للجسم Baby Powder لون Mauve 400مل', 'Body lotion with baby powder fragrance that deeply hydrates and softens the skin.', 'Lait corporel au parfum de poudre de bébé qui hydrate et adoucit la peau en profondeur.', 'لوشن للجسم برائحة بودرة الأطفال يرطب وينعم البشرة بعمق.', 'Apply on clean skin and massage gently until absorbed.', 'Appliquer sur peau propre et masser délicatement jusqu’à absorption.', 'يوضع على بشرة نظيفة ويدلك بلطف حتى الامتصاص.', 'https://cosmeticstoredz.com/wp-content/uploads/2026/02/CC-554.png', 900.00, NULL, '2026-05-08 21:55:41');

-- --------------------------------------------------------

--
-- Structure de la table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_categories`
--

INSERT INTO `product_categories` (`id`, `product_id`, `category_id`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1),
(6, 6, 1),
(7, 7, 1),
(8, 8, 1),
(9, 9, 1),
(10, 10, 1),
(11, 11, 1),
(12, 12, 1),
(13, 13, 1),
(14, 14, 1),
(15, 15, 1),
(16, 16, 1),
(17, 17, 1),
(18, 18, 1),
(19, 19, 1),
(20, 20, 1),
(21, 21, 1),
(22, 22, 1),
(23, 23, 1),
(24, 24, 1),
(25, 25, 1),
(26, 26, 1),
(27, 27, 1),
(28, 28, 1),
(29, 29, 1),
(30, 30, 1),
(31, 31, 1),
(32, 32, 1),
(33, 33, 1),
(34, 34, 1),
(35, 35, 1),
(36, 36, 1),
(37, 37, 1),
(38, 38, 1),
(81, 39, 3),
(82, 40, 3),
(83, 41, 3),
(84, 42, 3),
(85, 43, 3),
(86, 46, 3),
(87, 47, 3),
(88, 49, 3),
(89, 50, 3),
(90, 51, 3),
(91, 52, 3),
(92, 53, 3),
(93, 54, 3),
(94, 55, 3),
(95, 56, 3),
(96, 57, 3),
(97, 58, 3),
(98, 59, 3),
(116, 60, 2),
(117, 61, 2),
(118, 62, 2),
(119, 63, 2),
(120, 64, 2),
(121, 65, 2),
(122, 66, 2),
(123, 68, 2),
(124, 69, 4),
(125, 70, 4),
(126, 71, 4),
(127, 72, 4),
(128, 73, 4),
(129, 74, 4),
(130, 75, 4),
(131, 76, 4),
(132, 77, 4);

-- --------------------------------------------------------

--
-- Structure de la table `product_skin_types`
--

CREATE TABLE `product_skin_types` (
  `id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `skin_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `product_skin_types`
--

INSERT INTO `product_skin_types` (`id`, `product_id`, `skin_type_id`) VALUES
(1, 1, 1),
(2, 1, 3),
(3, 1, 5),
(4, 2, 1),
(5, 2, 3),
(6, 2, 5),
(7, 3, 1),
(8, 3, 3),
(9, 3, 5),
(10, 4, 1),
(11, 4, 2),
(12, 4, 3),
(13, 4, 4),
(14, 4, 5),
(15, 5, 1),
(16, 5, 3),
(17, 6, 2),
(18, 6, 4),
(19, 7, 5),
(20, 8, 1),
(21, 8, 2),
(22, 8, 3),
(23, 8, 4),
(24, 8, 5),
(25, 9, 1),
(26, 9, 3),
(27, 9, 5),
(28, 10, 2),
(29, 10, 4),
(30, 11, 1),
(31, 11, 2),
(32, 11, 3),
(33, 11, 4),
(34, 11, 5),
(35, 12, 1),
(36, 12, 2),
(37, 12, 3),
(38, 12, 4),
(39, 12, 5),
(40, 13, 1),
(41, 13, 3),
(42, 14, 2),
(44, 14, 4),
(43, 14, 5),
(45, 15, 1),
(46, 15, 2),
(47, 15, 3),
(48, 15, 4),
(49, 15, 5),
(50, 16, 1),
(51, 16, 2),
(52, 16, 3),
(53, 16, 4),
(54, 16, 5),
(55, 17, 1),
(56, 17, 3),
(57, 18, 2),
(58, 19, 1),
(59, 19, 2),
(60, 19, 3),
(61, 19, 4),
(62, 19, 5),
(63, 20, 1),
(64, 20, 2),
(65, 20, 3),
(66, 20, 4),
(67, 20, 5),
(68, 21, 1),
(69, 21, 2),
(70, 21, 3),
(71, 21, 4),
(72, 21, 5),
(73, 22, 1),
(74, 22, 2),
(75, 22, 3),
(76, 22, 4),
(77, 22, 5),
(78, 23, 1),
(79, 23, 2),
(80, 23, 3),
(81, 23, 4),
(82, 23, 5),
(83, 24, 2),
(84, 24, 4),
(85, 25, 2),
(86, 25, 4),
(87, 26, 2),
(88, 26, 4),
(89, 27, 1),
(90, 27, 2),
(91, 27, 3),
(92, 27, 4),
(93, 27, 5),
(94, 28, 1),
(95, 28, 2),
(96, 28, 3),
(97, 28, 4),
(98, 28, 5),
(99, 29, 1),
(100, 29, 2),
(101, 29, 3),
(102, 29, 4),
(103, 29, 5),
(104, 30, 1),
(105, 30, 2),
(106, 30, 3),
(107, 30, 4),
(108, 30, 5),
(109, 31, 1),
(110, 31, 2),
(111, 31, 3),
(112, 31, 4),
(113, 31, 5),
(114, 32, 1),
(115, 32, 2),
(116, 32, 3),
(117, 32, 4),
(118, 32, 5),
(119, 33, 2),
(120, 33, 4),
(121, 34, 1),
(122, 34, 2),
(123, 34, 3),
(124, 34, 4),
(125, 34, 5),
(126, 35, 1),
(127, 35, 2),
(128, 35, 3),
(129, 35, 4),
(130, 35, 5),
(131, 36, 1),
(132, 36, 2),
(133, 36, 3),
(134, 36, 4),
(135, 36, 5),
(136, 37, 2),
(137, 38, 4);

-- --------------------------------------------------------

--
-- Structure de la table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL CHECK (`rating` between 1 and 5),
  `comment` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `routine_steps`
--

CREATE TABLE `routine_steps` (
  `id` int(11) NOT NULL,
  `name_en` varchar(100) DEFAULT NULL,
  `name_fr` varchar(100) DEFAULT NULL,
  `name_ar` varchar(100) DEFAULT NULL,
  `period` enum('morning','evening','weekly') DEFAULT NULL,
  `step_order` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `routine_steps`
--

INSERT INTO `routine_steps` (`id`, `name_en`, `name_fr`, `name_ar`, `period`, `step_order`) VALUES
(1, 'Cleanser', 'Nettoyant', 'غسول', 'morning', 1),
(2, 'Toner', 'Tonique', 'تونر', 'morning', 2),
(3, 'Serum', 'Sérum', 'سيروم', 'morning', 3),
(4, 'Moisturizer', 'Hydratant', 'مرطب', 'morning', 4),
(5, 'Sunscreen', 'Écran solaire', 'واقي شمس', 'morning', 5),
(6, 'Makeup Remover', 'Démaquillant', 'مزيل ماكياج', 'evening', 1),
(7, 'Cleanser', 'Nettoyant', 'غسول', 'evening', 2),
(8, 'Toner', 'Tonique', 'تونر', 'evening', 3),
(9, 'Serum', 'Sérum', 'سيروم', 'evening', 4),
(10, 'Moisturizer', 'Hydratant', 'مرطب', 'evening', 5),
(11, 'Scrub', 'Gommage', 'مقشر', 'weekly', 1),
(12, 'Mask', 'Masque', 'ماسك', 'weekly', 2),
(13, 'Moisturizer', 'Hydratant', 'مرطب', 'weekly', 3),
(14, 'Eye Cream', 'Crème contour des yeux', 'كريم مرطب للعين', 'evening', 6);

-- --------------------------------------------------------

--
-- Structure de la table `skin_ai_results`
--

CREATE TABLE `skin_ai_results` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `detected_skin_type_id` int(11) DEFAULT NULL,
  `answers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`answers`)),
  `confidence` float DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `skin_types`
--

CREATE TABLE `skin_types` (
  `id` int(11) NOT NULL,
  `name_en` varchar(50) DEFAULT NULL,
  `name_fr` varchar(50) DEFAULT NULL,
  `name_ar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `skin_types`
--

INSERT INTO `skin_types` (`id`, `name_en`, `name_fr`, `name_ar`) VALUES
(1, 'Oily', 'Grasse', 'دهنية'),
(2, 'Dry', 'Sèche', 'جافة'),
(3, 'Combination', 'Mixte', 'مختلطة'),
(4, 'Sensitive', 'Sensible', 'حساسة'),
(5, 'Normal', 'Normale', 'عادية');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'fr',
  `skin_type_id` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `language`, `skin_type_id`, `created_at`) VALUES
(1, 'Mohamed ', 'haririmohamed@gmail.com', 'hoho', 'ar', 1, '2026-05-10 18:31:52'),
(2, 'cc', ' v', 'g', 'fr', 1, '2026-05-10 18:35:56'),
(3, 'rahooma', 'haririrahma10@gmail.com', 'hoho', 'ar', 1, '2026-05-11 19:07:21'),
(4, 'manel', 'haririmanel4@gmail.com', 'roro', 'en', 1, '2026-05-11 19:08:28'),
(5, 'cc', 'v', 'g', 'fr', 1, '2026-05-11 21:46:52'),
(6, 'gjj', 'bll', 'v\'j', 'en', 1, '2026-05-11 22:07:28'),
(7, 'hv', 'jk', 'jk', 'en', 1, '2026-05-11 22:16:35'),
(8, 'bllkm', 'mmm', 'pkk', 'ar', 1, '2026-05-11 22:30:47'),
(9, 'h', 'l', '0', 'fr', 1, '2026-05-11 22:32:29'),
(10, 'jgkl', 'hklb', 'blkj', 'fr', 1, '2026-05-11 23:02:02'),
(11, 'متت', 'تممن', 'ااب', 'ar', 1, '2026-05-11 23:08:43'),
(12, 'ىنموو', 'تمكنلة', 'ونمخت', 'fr', 1, '2026-05-11 23:42:31'),
(13, 'تلنك', 'ةنكل', 'بنك', 'fr', 1, '2026-05-12 00:36:33'),
(14, 'انعبيي', 'لتملي', 'انعب', 'en', 1, '2026-05-12 00:54:04'),
(15, 'تبباتنةى', 'لتنوبيبلن', 'لىنمالو', 'en', 1, '2026-05-12 01:20:08'),
(16, 'jfhkhg ', 'gjkhhk', 'cxyguov', 'en', 1, '2026-05-12 15:18:18'),
(17, 'dgkgflmm', 'gklhddb', 'gbkotf', 'en', 1, '2026-05-12 15:49:00'),
(18, 'gklgdll', 'gglmhd', 'gblouf', 'en', 1, '2026-05-12 16:02:27'),
(19, 'hfjlhklvv', 'gjllhv', 'gvlkyh', 'en', 1, '2026-05-12 16:12:41'),
(20, 'jkvblvkckfd', 'hxjxvlho', 'fkhlho', 'en', 1, '2026-05-12 16:39:22'),
(21, 'cllgdll', 'xgkgohlgkg', 'jfkhlhot', 'en', 1, '2026-05-12 16:55:36'),
(22, 'vkjpobb', 'blboibl', 'ihlvl', 'en', 1, '2026-05-12 19:06:37');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name_en` (`name_en`);

--
-- Index pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `step_id` (`step_id`);

--
-- Index pour la table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Index pour la table `product_skin_types`
--
ALTER TABLE `product_skin_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_id` (`product_id`,`skin_type_id`),
  ADD KEY `skin_type_id` (`skin_type_id`);

--
-- Index pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`,`product_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Index pour la table `routine_steps`
--
ALTER TABLE `routine_steps`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `skin_ai_results`
--
ALTER TABLE `skin_ai_results`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `detected_skin_type_id` (`detected_skin_type_id`);

--
-- Index pour la table `skin_types`
--
ALTER TABLE `skin_types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `skin_type_id` (`skin_type_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT pour la table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- AUTO_INCREMENT pour la table `product_skin_types`
--
ALTER TABLE `product_skin_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=138;

--
-- AUTO_INCREMENT pour la table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `routine_steps`
--
ALTER TABLE `routine_steps`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `skin_ai_results`
--
ALTER TABLE `skin_ai_results`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `skin_types`
--
ALTER TABLE `skin_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`step_id`) REFERENCES `routine_steps` (`id`);

--
-- Contraintes pour la table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_categories_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Contraintes pour la table `product_skin_types`
--
ALTER TABLE `product_skin_types`
  ADD CONSTRAINT `product_skin_types_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `product_skin_types_ibfk_2` FOREIGN KEY (`skin_type_id`) REFERENCES `skin_types` (`id`);

--
-- Contraintes pour la table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `skin_ai_results`
--
ALTER TABLE `skin_ai_results`
  ADD CONSTRAINT `skin_ai_results_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `skin_ai_results_ibfk_2` FOREIGN KEY (`detected_skin_type_id`) REFERENCES `skin_types` (`id`);

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`skin_type_id`) REFERENCES `skin_types` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
