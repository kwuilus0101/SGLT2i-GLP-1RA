library(ggplot2)
library(readxl)
library(dplyr)

###############Combined vs SGLT2#################################################

# Read the data from your Excel file
data <- read_excel("C:\\Users\\USER\\Documents\\0_研究總覽\\!1_Studies\\20240424_GLP1+SGLT2\\Result\\20240226_Mortality_for R.xlsx")

# Assuming your Excel has columns 'Outcome', 'Estimate', 'LowerCI', 'UpperCI'
# Rename the columns if they have different names in your file
data <- data %>% 
  rename(
    Outcome = Outcome, 
    Estimate = Estimate, 
    LowerCI = LowerCI, 
    UpperCI = UpperCI
  )

# 確保 Outcome 是一個因子並且按照您想要的順序排列（這裡是反轉順序）
data$Outcome <- factor(data$Outcome, levels = rev(unique(data$Outcome)))


# Create the forest plot
p <- ggplot(data, aes(x = Estimate, y = Outcome)) +
  geom_point(size = 3) +  # Point estimates
  geom_errorbarh(aes(xmin = LowerCI, xmax = UpperCI), height = 0.2) +  # Confidence intervals
  geom_vline(xintercept = 1, linetype = "dashed", color = "black") +  # Reference line
  xlim(c(0, 2)) +  # Set x-axis limits
  theme_minimal() +  # Minimal theme
  theme(
    axis.title.x = element_text(face = "bold"),  # Bold x-axis title
    axis.text.x = element_text(size = 12),  # Size for x-axis labels
    axis.text.y = element_text(size = 12)   # Size for y-axis labels
  ) +
  xlab("Hazard Ratio") +  # X-axis label
  ylab("")  # No y-axis label

# Annotations for "Favors Combined" and "Favors SGLT2i"
p <- p + 
  annotate("text", x = 0.5, y = length(data$Outcome) + 0.5, label = "Favors Combined", hjust = 0.5, size = 4) +
  annotate("text", x = 1.5, y = length(data$Outcome) + 0.5, label = "Favors SGLT2i", hjust = 0.5, size = 4)

# Display the plot
p


###############Combined vs GLP1RA#################################################


# Read the data from your Excel file
data <- read_excel("C:\\Users\\USER\\Documents\\0_研究總覽\\!1_Studies\\20240424_GLP1+SGLT2\\Result\\20240226_Combined_GLP1_for R.xlsx")

# Assuming your Excel has columns 'Outcome', 'Estimate', 'LowerCI', 'UpperCI'
# Rename the columns if they have different names in your file
data <- data %>% 
  rename(
    Outcome = Outcome, 
    Estimate = Estimate, 
    LowerCI = LowerCI, 
    UpperCI = UpperCI
  )

# 確保 Outcome 是一個因子並且按照您想要的順序排列（這裡是反轉順序）
data$Outcome <- factor(data$Outcome, levels = rev(unique(data$Outcome)))


# Create the forest plot
p <- ggplot(data, aes(x = Estimate, y = Outcome)) +
  geom_point(size = 3) +  # Point estimates
  geom_errorbarh(aes(xmin = LowerCI, xmax = UpperCI), height = 0.2) +  # Confidence intervals
  geom_vline(xintercept = 1, linetype = "dashed", color = "black") +  # Reference line
  xlim(c(0, 2)) +  # Set x-axis limits
  theme_minimal() +  # Minimal theme
  theme(
    axis.title.x = element_text(face = "bold"),  # Bold x-axis title
    axis.text.x = element_text(size = 12),  # Size for x-axis labels
    axis.text.y = element_text(size = 12)   # Size for y-axis labels
  ) +
  xlab("Hazard Ratio") +  # X-axis label
  ylab("")  # No y-axis label

# Annotations for "Favors Combined" and "Favors SGLT2i"
p <- p + 
  annotate("text", x = 0.6, y = length(data$Outcome) + 0.5, label = "Favors Combined", hjust = 0.5, size = 4) +
  annotate("text", x = 1.3, y = length(data$Outcome) + 0.5, label = "Favors GLP1-RA", hjust = 0.5, size = 4)

# Display the plot
p

############################SGLT2i vs GLP1RA################################

# Read the data from your Excel file
data <- read_excel("C:\\Users\\USER\\Documents\\0_研究總覽\\!1_Studies\\20240424_GLP1+SGLT2\\Result\\20240226_SGLT2_GLP1_for R.xlsx")

# Assuming your Excel has columns 'Outcome', 'Estimate', 'LowerCI', 'UpperCI'
# Rename the columns if they have different names in your file
data <- data %>% 
  rename(
    Outcome = Outcome, 
    Estimate = Estimate, 
    LowerCI = LowerCI, 
    UpperCI = UpperCI
  )

# 確保 Outcome 是一個因子並且按照您想要的順序排列（這裡是反轉順序）
data$Outcome <- factor(data$Outcome, levels = rev(unique(data$Outcome)))


# Create the forest plot
p <- ggplot(data, aes(x = Estimate, y = Outcome)) +
  geom_point(size = 3) +  # Point estimates
  geom_errorbarh(aes(xmin = LowerCI, xmax = UpperCI), height = 0.2) +  # Confidence intervals
  geom_vline(xintercept = 1, linetype = "dashed", color = "black") +  # Reference line
  xlim(c(0, 2)) +  # Set x-axis limits
  theme_minimal() +  # Minimal theme
  theme(
    axis.title.x = element_text(face = "bold"),  # Bold x-axis title
    axis.text.x = element_text(size = 12),  # Size for x-axis labels
    axis.text.y = element_text(size = 12)   # Size for y-axis labels
  ) +
  xlab("Hazard Ratio") +  # X-axis label
  ylab("")  # No y-axis label

# Annotations for "Favors Combined" and "Favors SGLT2i"
p <- p + 
  annotate("text", x = 0.6, y = length(data$Outcome) + 0.5, label = "Favors SGLT2i", hjust = 0.5, size = 4) +
  annotate("text", x = 1.3, y = length(data$Outcome) + 0.5, label = "Favors GLP1-RA", hjust = 0.5, size = 4)

# Display the plot
p
