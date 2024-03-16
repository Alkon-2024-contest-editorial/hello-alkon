#import "template.typ": *
#import "abstractions.typ" : abstract_page
#import "problems.typ" : contest_problems
#import "colors.typ" : *
#import "description.typ" : create_page
#show: project.with()


#abstract_page(problems: contest_problems)

#for i in range(contest_problems.len()) {
  create_page(i)
}