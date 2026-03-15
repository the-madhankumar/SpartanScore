// ignore_for_file: constant_identifier_names, non_constant_identifier_names

class Team {
  final String name;
  final int bestYear;
  final List<String> players;

  const Team({
    required this.name,
    required this.bestYear,
    required this.players,
  });
}

class TeamCode {
  static const Team CSK = Team(
    name: "Chennai Super Kings",
    bestYear: 2018,
    players: [
      "MS Dhoni",
      "Shane Watson",
      "Faf du Plessis",
      "Suresh Raina",
      "Ambati Rayudu",
      "Ravindra Jadeja",
      "Dwayne Bravo",
      "Deepak Chahar",
      "Shardul Thakur",
      "Imran Tahir",
      "Ruturaj Gaikwad"
    ],
  );

  static const Team MI = Team(
    name: "Mumbai Indians",
    bestYear: 2020,
    players: [
      "Rohit Sharma",
      "Quinton de Kock",
      "Suryakumar Yadav",
      "Ishan Kishan",
      "Hardik Pandya",
      "Kieron Pollard",
      "Krunal Pandya",
      "Rahul Chahar",
      "Trent Boult",
      "Jasprit Bumrah",
      "Jofra Archer"
    ],
  );

  static const Team RCB = Team(
    name: "Royal Challengers Bangalore",
    bestYear: 2016,
    players: [
      "Virat Kohli",
      "AB de Villiers",
      "Chris Gayle",
      "KL Rahul",
      "Shane Watson",
      "Sachin Baby",
      "Stuart Binny",
      "Yuzvendra Chahal",
      "Sreenath Aravind",
      "Chris Jordan",
      "Washington Sundar"
    ],
  );

  static const Team KKR = Team(
    name: "Kolkata Knight Riders",
    bestYear: 2014,
    players: [
      "Gautam Gambhir",
      "Robin Uthappa",
      "Manish Pandey",
      "Yusuf Pathan",
      "Andre Russell",
      "Sunil Narine",
      "Piyush Chawla",
      "Umesh Yadav",
      "Morne Morkel",
      "Shakib Al Hasan",
      "Dinesh Karthik"
    ],
  );

  static const Team SRH = Team(
    name: "Sunrisers Hyderabad",
    bestYear: 2016,
    players: [
      "David Warner",
      "Shikhar Dhawan",
      "Moises Henriques",
      "Yuvraj Singh",
      "Ben Cutting",
      "Naman Ojha",
      "Bhuvneshwar Kumar",
      "Mustafizur Rahman",
      "Ashish Nehra",
      "Barinder Sran",
      "Rashid Khan"
    ],
  );

  static const Team RR = Team(
    name: "Rajasthan Royals",
    bestYear: 2008,
    players: [
      "Shane Warne",
      "Shane Watson",
      "Graeme Smith",
      "Yusuf Pathan",
      "Sohail Tanvir",
      "Ravindra Jadeja",
      "Swapnil Asnodkar",
      "Mahesh Rawat",
      "Dimitri Mascarenhas",
      "Siddharth Trivedi",
      "Rahul Dravid"
    ],
  );

  static const Team DC = Team(
    name: "Delhi Capitals",
    bestYear: 2020,
    players: [
      "Shreyas Iyer",
      "Shikhar Dhawan",
      "Rishabh Pant",
      "Marcus Stoinis",
      "Shimron Hetmyer",
      "Axar Patel",
      "Ravichandran Ashwin",
      "Kagiso Rabada",
      "Anrich Nortje",
      "Prithvi Shaw",
      "David Warner"
    ],
  );

  static const Team PBKS = Team(
    name: "Punjab Kings",
    bestYear: 2014,
    players: [
      "George Bailey",
      "Glenn Maxwell",
      "David Miller",
      "Virender Sehwag",
      "Wriddhiman Saha",
      "Axar Patel",
      "Mitchell Johnson",
      "Sandeep Sharma",
      "Parvinder Awana",
      "Manan Vohra",
      "KL Rahul"
    ],
  );

  static const Team GT = Team(
    name: "Gujarat Titans",
    bestYear: 2022,
    players: [
      "Hardik Pandya",
      "Shubman Gill",
      "David Miller",
      "Rahul Tewatia",
      "Wriddhiman Saha",
      "Rashid Khan",
      "Mohammed Shami",
      "Lockie Ferguson",
      "Sai Sudharsan",
      "Alzarri Joseph",
      "Shivam Dube"
    ],
  );

  static const Team LSG = Team(
    name: "Lucknow Super Giants",
    bestYear: 2022,
    players: [
      "KL Rahul",
      "Quinton de Kock",
      "Deepak Hooda",
      "Marcus Stoinis",
      "Krunal Pandya",
      "Ayush Badoni",
      "Jason Holder",
      "Avesh Khan",
      "Mohsin Khan",
      "Ravi Bishnoi",
      "Kagiso Rabada"
    ],
  );

  static const Map<String, Team> teamsMap = {
    "Chennai Super Kings": CSK,
    "Mumbai Indians": MI,
    "Royal Challengers Bangalore": RCB,
    "Kolkata Knight Riders": KKR,
    "Sunrisers Hyderabad": SRH,
    "Rajasthan Royals": RR,
    "Delhi Capitals": DC,
    "Punjab Kings": PBKS,
    "Gujarat Titans": GT,
    "Lucknow Super Giants": LSG,
  };
}