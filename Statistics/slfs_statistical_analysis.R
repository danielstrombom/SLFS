# load packages
library(tidyverse)
library(mgcv)
library(gratia)
library(broom.mixed)
library(kableExtra)
library(DHARMa)
library(sjPlot)
library(sjlabelled)
library(sjmisc)
library(scales)

# set plot theme
theme_set(theme_minimal(base_size = 13))

# load data
data_1 <- read_csv("data_1.csv")

# create interstate presence/absence variable and log scale population
data_1 <- data_1 %>%
  mutate(pop_log = log10(pop),
         infested = i21,
         is_presence = ifelse(is_presence == 0, "No","Yes"))

# gam statistical model
mod_form_21 <- infested ~ is_presence + std_gc + is_presence:std_gc + pop_log + 
  te(longitude,latitude)

gam_mod_21 <- gam(mod_form_21,data=data_1,
                  family = binomial(),
                  method = "REML")

# model results

# plot model results
gam_mod_21_ests <- plot_model(gam_mod_21)$data %>%
  tibble() %>%
  mutate(coeff = factor(c("IS Presence (Yes)","Garden Centers","Population","IS Presence (Yes) : Garden Centers"),levels=c("IS Presence (Yes) : Garden Centers","Population","Garden Centers","IS Presence (Yes)")))

gam_mod_21_ests %>%
  ggplot(aes(x=log(estimate),y=coeff)) + 
  geom_point(size=3) + 
  geom_errorbar(aes(xmin=log(conf.low), xmax=log(conf.high)), 
                width=0.0,
                position=position_dodge(0.05),linewidth=1) +
  annotate(geom = "text", x = log(3.34)+0.1,y=4.2,label="p-value=0.054",size=2.5) +
  annotate(geom = "text", x = log(0.276),y=3.2,label="p-value=0.041",size=2.5) +
  annotate(geom = "text", x = log(5.37),y=2.2,label="p-value=0.046",size=2.5) +
  annotate(geom = "text", x = log(7.10),y=1.2,label="p-value=0.005",size=2.5) +
  scale_x_continuous(breaks = log(c(0.01,0.1,1.0,10.0,100.0)), 
                     labels = c(0.01,0.1,1.0,10.0,100.0),
                     limits = log(c(0.01,100.0))) + 
  labs(x = "Odds Ratio", y = "", title = "Parametric estimates for infestation") + 
  geom_vline(xintercept = 0.0,linetype="dashed")


# model results table
gam_mod_21_summ <- summary(gam_mod_21)

results_df <- tibble(Coefficient = c("Intercept","IS Presence - Yes","Garden Centers","Population (log)","IS Presence - Yes : Garden Centers"),
                     Estimate = gam_mod_21_summ$p.coeff,
                     SE = gam_mod_21_summ$se[1:5],
                     `p-value` = gam_mod_21_summ$p.pv)

results_df

