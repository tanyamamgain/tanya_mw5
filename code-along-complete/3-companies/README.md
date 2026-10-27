# Step 3: Company, used, then given rules

What this step built: a script that uses `Company` with no model code at all, then rules for
`Company` written as sentences in `DONE.md`, a test for each sentence, and the one line of
model code that makes them pass. The files here sit at the same paths as in your app.

| Compare | With your |
|---|---|
| `scripts/list-companies.rb` | `scripts/list-companies.rb` |
| `DONE.md` | `DONE.md` |
| `test/models/company_test.rb` | `test/models/company_test.rb` |
| `app/models/company.rb` | `app/models/company.rb` |

## Part 1: use it

`scripts/list-companies.rb` saves three companies, finds one by its name, changes its url,
and prints them all:

```
Apple, Cupertino, https://www.apple.com
Amazon, Seattle, https://www.amazon.com
Anthropic, San Francisco, https://claude.ai
```

`app/models/company.rb` was still empty when it ran. The migration gave you saving,
finding and changing; ActiveRecord wrote the SQL, which is in `log/development.log`.

## Part 2: what can't be allowed

The rules are the sentences under Company in `DONE.md`. Each test in
`test/models/company_test.rb` is named with its sentence, so you can match them up by reading,
and when a test fails, its name tells you which rule broke.

Your agent's tests won't match these line for line, and they shouldn't: they came from your
rules, not these. Check the same two things for both: every sentence has a test, and each test
checks what its sentence says. A sentence in your `DONE.md` with no test is a rule your app
doesn't enforce yet, however sure your agent sounded.

Both tests failed first, and one line in the model made them pass:

```ruby
validates :name, presence: true, uniqueness: true
```

No tests, or no failing run first? Your agent may have written the model before the tests.
Ask it to follow the first rule in `AGENTS.md`: tests first, and show them failing.
