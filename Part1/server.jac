walker interact {
    can return_message with `root entry {
        report {
            "response": "Hello, world!"
        };
    }
}

walker interact_with_body {
    has name: str;

    can return_message with `root entry {
        report {
            "response": "Hello, " + self.name + "!"
        };
    }
}

walker time_based_greeting {
    has current_hour: int;

    can return_message with `root entry {
        if self.current_hour < 12 {
            report {
                "response": "Good morning!"
            };
        } elif self.current_hour < 18 {
            report {
                "response": "Good afternoon!"
            };
        } else {
            report {
                "response": "Good evening!"
            };
        }
    }
}


walker interact_with_user {
    has username: str;

    can return_message with `root entry {
        report {
            "response": "Greetings, " + self.username + "!"
        };
    }
}

walker fun_fact_greeting {
    has username: str;

    can return_message with `root entry {
        let facts = [
            "Giraffes are 30 times more likely to get hit by lightning than people.",
            "Animals can be allergic to humans.",
            "A day on Venus is longer than a year on Venus."
        ];

        # Create a simple way to simulate randomness based on username length
        let index = len(self.username) % len(facts);

        # Select a fact based on the index
        let selected_fact = facts[index];

        report {
            "response": "Hello, " + self.username + "! Here's a fun fact: " + selected_fact
        };
    }
}
