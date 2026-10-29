# graded8.R
# Tiffany Agosto-Martinez
# 10/28/2026
# ANOVA testing in R

# Create a data frame
df <- data.frame(RecipeA = c(0, 4, 4, 5, 4, 1, 2, 3, 3, 5),
                 RecipeB = c(7, 6, 4, 2, 3, 0, 8, 6, 2, 3),
                 RecipeC = c(1, 0, 1, 0, NA, 1, 1, NA, 1, 0)
                 )

# use the stack function, remove the NA using na.omit, and view new data frame
newdf <- na.omit(stack(df))
print("stacked data frame:\n")
print(newdf)

# Run a summary of the stacked data to view it's structure and statistics
print("initial summary:\n")
summary(newdf)

# Run a ANOVA using the aov function using formula notation
anova_results <- aov(formula = values ~ ind, data = newdf)

# Response Variable: "values" (symptoms score)
# Predictor Variables: "ind" (recipe group factor)

# Null hypothesis (H0): The true mean symptoms scores are equal across all
# three recipes.

# Alternative Hypothesis (HA): At least one of the mean symptoms scores is 
# different the other scores.

# Display ANOVA table results
anova_summary <- summary(anova_results)
print("anova summary:\n")
print(anova_summary)

# Extract p-value and print the p-value
pval <- anova_summary[[1]]$`Pr(>F)`[1]
cat("p_value is ", pval, "\n")

# Hypothesis conclusion
if (pval < 0.05) {
  cat("Sufficient evidence to reject the null hypothesis.",
      "\nIngredient X may have an effect on the results.")
} else {
  cat("Insufficient evidence to reject the null hypothesis.",
      "\nIngredient X may have an effect on the results.") 
}
