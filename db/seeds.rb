# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'Faker'


Representative.create(
first_name: "Bernie",
last_name: "Sanders",
office: "United States Senator from Vermont",
email: "senator@vt.gov",
party: "Independent",
bio: "Bernard Sanders (born September 8, 1941) is an American politician who has been the junior United States Senator from Vermont since 2007. Sanders is the longest serving independent in U.S. congressional history. Since his election to the House of Representatives in 1990, he has caucused with the Democratic Party, which has entitled him to congressional committee assignments and at times given Democrats a majority. Sanders became the ranking minority member on the Senate Budget Committee in January 2015; he had previously been chair of the Senate Veterans' Affairs Committee for two years.",
elected: Date.today,
phone_number: "888-909-7926",
picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/de/Bernie_Sanders.jpg/220px-Bernie_Sanders.jpg",
user_id: 1
)

Representative.create(
first_name: "Donald",
last_name: "Trump",
office: "45th President of the United States",
email: "president@whitehouse.gov",
party: "Republican",
bio: "Donald John Trump (born June 14, 1946) is the 45th and current President of the United States, in office since January 20, 2017. Before entering politics, he was a businessman and television personality.",
elected: Date.today,
phone_number: "888-909-7926",
picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0e/Donald_Trump_Pentagon_2017.jpg/220px-Donald_Trump_Pentagon_2017.jpg",
user_id: 1
)

Representative.create(
first_name: "Paul",
last_name: "Ryan",
office: "54th Speaker of the United States House of Representatives",
email: "speaker@house.gov",
party: "Republican",
bio: "Paul Davis Ryan Jr. (born January 29, 1970) is an American politician who is the 54th and current Speaker of the United States House of Representatives. He was the Republican Party nominee for Vice President of the United States, running alongside former Governor Mitt Romney of Massachusetts, in the 2012 election.",
elected: Date.today,
phone_number: "888-909-7926",
picture_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/f/f3/Speaker_Paul_Ryan_official_photo_%28cropped_2%29.jpg/220px-Speaker_Paul_Ryan_official_photo_%28cropped_2%29.jpg",
user_id: 1
)

Representative.create(
first_name: "Darrell",
last_name: "Clarke",
office: "Philadelphia City Council President and District 5 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "DARRELL L. CLARKE is the President of City Council and represents the 5th Council District which includes North Central Philadelphia, Strawberry Mansion, Lower Hunting Park, Ludlow, Yorktown, West Poplar, Fairhill, Brewerytown, Francisville, Spring Garden, Fairmount, Logan Square, and parts of Northwood, Fishtown, Northern Liberties, and Center City.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/DarrellClarke.jpg",
user_id: 1
)

Representative.create(
first_name: "Kenyatta",
last_name: "Johnson",
office: "Philadelphia City Council District 2 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "A man with a mission to serve, Councilman Kenyatta Johnson represents the 2nd District, which covers parts of Center City, South and Southwest Philadelphia and also includes the stadium area, Philadelphia International Airport, the Navy Yard and the Eastwick, Grays Ferry, Hawthorne and Point Breeze neighborhoods.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Kenyatta-J-Edit-1.jpg",
user_id: 1
)

Representative.create(
first_name: "Jannie",
last_name: "Blackwell",
office: "Philadelphia City Council District 3 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "Jannie L. Blackwell, a six-term council member born and reared in Philadelphia, is a seasoned advocate for social change with a 30-year reputation for serving community members and the poor and underprivileged in the City of Philadelphia, making her a leader in our City with her own vision.",
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Jannie-Blackwell-Edit-1.jpg",
user_id: 1
)

Representative.create(
first_name: "Mark",
last_name: "Squilla",
office: "Philadelphia City Council District 1 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "Mark Squilla represents City Council\'s First District, a diverse and growing area that stretches along the Delaware River from his native South Philadelphia across Center City, Chinatown, Northern Liberties, Fishtown, Kensington and Port Richmond.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Mark-S-Edit-1.jpg",
user_id: 1
)


Representative.create(
first_name: "Curtis",
last_name: "Jones Jr.",
office: "Philadelphia City Council District 4 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "The Honorable Curtis Jones Jr. represents the 4th District of Philadelphia, Pennsylvania which includes Allegheny West, Belmont Village, East Falls, Manayunk, Overbrook, Overbrook Park, Roxborough, Wynnefield and sections of West Philadelphia.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Curtis-Jones.jpg",
user_id: 1
)

Representative.create(
first_name: "Bobby",
last_name: "Henon",
office: "Philadelphia City Council District 6 Representative and Democrat Majority Leader",
email: "council@phila.gov",
party: "Democrat",
bio: "A life long resident of Northeast Philadelphia, Councilman Bobby Henon proudly represents his neighbors in Philadelphia\'s 6th Councilmanic District, which includes the communities of Tacony, Mayfair, Holmesburg, Lexington Park, Holme Circle, Ashton, Bridesburg, Wissinoming, Port Richmond, East Torresdale, Castor Gardens, Oxford Circle, Rhawnhurst, Bells Corner, Winchester Park, Academy Gardens, Pennypack and Frankford.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Boby-Henon.jpg",
user_id: 1
)

Representative.create(
first_name: "Maria",
last_name: "Quinones-Sanchez",
office: "Philadelphia City Council District 7 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "Councilwoman Maria D. Quinones-Sanchez is a veteran activist with over 30 years of service to the City of Philadelphia, currently serving a third four-year term on Philadelphia City Council. Maria has advocated tirelessly for creating and preserving family-sustaining jobs, investing in a trained and educated workforce, reducing blight and transforming vacant land, keeping families in their homes, mandating ethics and transparency in government, revitalizing neighborhood economies, reforming unsafe demolition practices, and securing the rights of women, families, and workers across the City.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/MariaQSanchez-edit-1.jpg",
user_id: 1
)

Representative.create(
first_name: "Cindy",
last_name: "Bass",
office: "Philadelphia City Council District 8 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "The Honorable Cindy Bass represents the 8th District of Philadelphia, which includes Chestnut Hill, Mount Airy, Germantown, Nicetown, Tioga, Logan, and parts of North Philadelphia. First elected to City Council in 2011, Councilwoman Bass has been a tireless fighter for safe and livable neighborhoods, empowering underserved communities, and removing barriers to access and opportunity for those Philadelphians who need it most. Currently serving her second term, Councilwoman Bass is the Chair of the Committee on Public Health and Human Services, the Committee on Parks, Recreation, and Cultural Affairs, and Vice-Chair of the Committee on the Environment.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/Cindy-Bass-edit-1.jpg",
user_id: 1
)

Representative.create(
first_name: "Cherelle",
last_name: "Parker",
office: "Philadelphia City Council District 9 Representative",
email: "council@phila.gov",
party: "Democrat",
bio: "Councilwoman Cherelle L. Parker proudly serves the Ninth Council District in the City of Philadelphia. This region spans throughout northwest and northeast Philadelphia communities that include Mt. Airy, West Oak Lane, East Oak Lane, Olney, Lawncrest, Lawndale, Burholme and Oxford Circle.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/C-Parker-edit-1.jpg",
user_id: 1
)

Representative.create(
first_name: "Brian",
last_name: "O\'neill",
office: "Philadelphia City Council District 10 Representative and Republican Majority Leader",
email: "council@phila.gov",
party: "Republican",
bio: "BRIAN J. O\'NEILL is now serving his tenth four-year term on the Philadelphia City Council. He is a graduate of Saint Joseph\'s University and Widener University School of Law.",
elected: Date.today,
phone_number: "215-686-3442",
picture_url: "http://phlcouncil.com/wp-content/uploads/2016/01/BrianONeill.jpg",
user_id: 1
)
