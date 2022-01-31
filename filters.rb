# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.select{|c| c[:id]== id}
end

def experienced?(candidate)
  if candidate[:years_of_experience] >=2
    return true
  else 
    return false
  end
end


def qualified_candidates(candidates)
  candidates.keep_if{|c| experienced?(c) and        c[:github_points]>100 and (c[:languages].include?("Ruby")|| c[:languages].include?("Python")) and c[:date_applied]>=Date.today-15 and c[:age]>17
}
end

# More methods will go below

def ordered_by_qualifications(candidates)
  candidates.sort_by{|c| [-c[:years_of_experience],-c[:github_points]]}
end