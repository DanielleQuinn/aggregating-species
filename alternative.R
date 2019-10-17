# This is a function- / loop-free alternative offered by
# Jordan Ryda (@jryda_) - thanks!

mydata %>% 
  pivot_longer(-sample, names_to = "species") %>% 
  mutate(species = str_extract(species, "(?<=\\.).*")) %>% 
  group_by(sample, species) %>% 
  summarise(value = as.numeric(sum(value) > 0)) %>% 
  pivot_wider(names_from = "species")
