# Review of key points from EH 6124

These are the major points from [**EH6124: Introduction to Clinical Trial Design and Analysis**](https://www.ucc.ie/admin/registrar/modules/?mod=EH6124). Please ask any questions on the discussion board if you need to clarify anything, or even if you just want to argue with me.

## The role of the statistician

Successful clinical trials require teams with a variety of expertise. Though many scientists and clinical investigators receive some training in statistics and study design, this training is usually rudimentary, and often clumsy. The trial statistician is thus needed to provide expert guidance in these areas, and so should be heavily involved in the design, analysis, and reporting phases of the project. However, to do their job properly, the statistician must rely on the subject matter expertise of the clinical investigators. Thus the scientific goals of clinical trials are best met when there are close collaborations between clinical investigators and statisticians.

**Selected reading:**

[The Statistician's Role in Developing a Protocol for a Clinical Trial](https://amstat.tandfonline.com/doi/abs/10.1080/00031305.1979.10482674) 

[Bridging Clinical Investigators and Statisticians: Writing the Statistical Methodology for a Research Proposal](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4415704/)

## Causal inference

Most clinical studies estimate and report an association between an outcome (e.g. mortality) and an exposure (such being randomly allocated to one study arm or another). Usually we want to make some inferences about that estimated association, to help us decide whether the exposure caused the outcome, i.e. would the observed distribution of the outcome have been different had there been no exposure? Our confidence in any causal inferences largely rests on an assumption of “no confounding” which means there aren’t any other extraneous factors that cause both the exposure and the outcome. This vaguely-stated condition can be explicitly described using [Directed Acyclic Graphs](http://dagitty.net/), which we can use to show that if an exposure is indeed randomly allocated, then there can be no confounding. Thus randomization allows us to make causal inferences with the fewest/most-palatable assumptions, compared to other methods (e.g. adjusting/controlling for suspected confounders).  

**Selected reading:**

[A structural approach to selection bias](https://www.ncbi.nlm.nih.gov/pubmed/15308962)

## Regression to the mean

Patients often enter a clinical trial when they are ill, and most illnesses have some natural variability in their progression. This means that if I recruit a sample of sick people and do nothing, some will get better anyway, and thus the health of the group will have improved, on average. This is called regression to the mean. Unfortunately, many researchers set up similar scenarios, except they *do* intervene in some way, and then mistakenly attribute the improvement in their sample’s average health as an effect of intervention. This is why we include concurrent control groups in RCTs. Then we can get an estimate of the magnitude of regression to the mean (from the control group), which we can then subtract from our estimated treatment effect in the active arm by literally looking at the difference in outcomes between the study arms. This doesn’t mean we can’t ever make inferences from within-group comparisons (pre vs post) or using “historical” controls (control groups external to our trial), but we should do so much more cautiously, and not expect many other people to trust our results even if we do.

**Selected reading:**

[Sensitivity and Specificity of Clinical Trials - Randomized v Historical Controls ](https://jamanetwork.com/journals/jamainternalmedicine/fullarticle/603025)

[The use of historical controls and concurrent controls to assess the effects of sulphonamides, 1936-1945. JLL Bulletin: Commentaries on the history of treatment evaluation](https://www.jameslindlibrary.org/articles/the-use-of-historical-controls-and-concurrent-controls-to-assess-the-effects-of-sulphonamides-1936-1945/)

[Workplace Wellness Programs Don’t Work Well. Why Some Studies Show Otherwise](https://www.nytimes.com/2018/08/06/upshot/employer-wellness-programs-randomized-trials.html)

## Equipoise and ethics

When we run a RCT, we are exposing patients to unknown risks in the hopes of learning something important about treatment that might benefit future patients, as well as those enrolled in the trial. For this to be ethical, it means that at a minimum, all patients enrolled in the trial must get at least the same quality of care as they would have if they hadn’t enrolled in the trial. It also means that there should be a genuine uncertainty about the potential benefits of the new intervention – that is that we should be in a state of equipoise. Equipoise can be hard to demonstrate, so it’s important for investigators to clearly make their case that it exists (though this often doesn’t happen). In my opinion, this is an area where patient voices should have more prominence. The ethical obligations of the trial also mean that we should stand to learn something important, which means that shoddy comparators (known to be substandard, thus stacking the deck in favour of the new treatment) and other preventable design flaws are arguably unethical.

**Selected reading:**

[Equipoise in Research - Integrating Ethics and Science in Human Research](https://jamanetwork.com/journals/jama/fullarticle/2600451)

[Is the concept of clinical equipoise still relevant to research?](https://www.bmj.com/content/359/bmj.j5787)

[Choice of control group in randomised trials of cancer medicine: are we testing trivialities?](https://www.thelancet.com/journals/lanonc/article/PIIS1470-2045(18)30501-1/fulltext)

## Patient selection

We must carefully consider which patients to enroll on our RCT. This will largely depend on the overall goals of the trial. In the initial phase 3 trials for a new treatment, we are often most interested in seeing if the intervention can work in a “best-case” scenario. This means that we select patients in a manner that maximizes the internal validity of the trial, with little or no consideration for the external validity or generalizability. In turn, this means recruiting patients that are most likely to benefit from, and adhere to, the proposed treatment (based on our current understanding). It also means recruiting a more homogeneous sample, to reduce natural variability in the outcome. This will make it easier to see the effects of our intervention, if there is one, using a smaller sample than would be required to see the same effect in a broader, more heterogeneous sample. This best-case scenario makes sense for newly tested treatments, since it’s less costly (less money, fewer patients exposed unknown risks), and because if we fail to see an effect under these favourable conditions, it’s probably safe to conclude that we can move on from this intervention to pursue other possibilities.

That said, once we’ve demonstrated the efficacy of an intervention in trials with a high internal validity (i.e. we’ve demonstrated that the intervention *can* work), we will like want to see if it *does* work (paraphrasing Senn) when applied in something that looks more like normal clinical practice. This is where effectiveness (or [pragmatic](https://www.precis-2.org/)) trials come in, where we want more broadly representative samples and scenarios. The implication is that there might be practical issues with compliance in a broader sample, or that there might be heterogeneity in treatment effects (HTE). This means that some groups of patients will benefit more or less from the intervention than other groups, and that these different groups might have been disproportionately represented in the earlier efficacy trials we described above. Unfortunately, the sample size required to demonstrate such interactions can be much larger than that needed to demonstrate the marginal (on average) effect of the treatment, so frequently concerns about HTE are not evidenced. Regardless, demonstrating a beneficial average treatment effect in a more generalizable sample is still very comforting, especially to people who make health technology assessments (i.e. the people who decide which treatments to fund with public money).

Importantly, even if we have reason to expect no HTE, we want to be mindful of representation. This means working to ensure that all patients have access to participate in clinical trials, as patients enrolled on trials, even when the new treatment doesn’t out-perform standard care, often have better outcomes than those who aren’t enrolled. Poor representation, which is unfortuately typical in clinical trials (for example, of women or underepresented minorities), can also degrade trust in clinical research in general (and understandably so).

Lastly, we control the composition of the patient sample with inclusion and exclusion criteria. A common mistake is to make a list where the list exclusions are just the conversely-stated inclusion criteria (e.g. inclusion: age >= 65 years; exclusion: age < 65 years). It’s better to consider inclusion as controlling entry into the trial to get a more/less homogeneous sample, and to precisely define the disease/problem we are trying to impact.  Exclusions then, which should usually be fewer, are typically used to excluded people that can’t consent, that aren’t expected to possibly benefit from the new treatment, or that might be a higher than acceptable risk (in either arm). Patients are often excluded based on flawed reasoning about homogeneity (presumably to increase the internal validity of the trial), which can only be considered with respect to factors that predict variability in the outcome, i.e. there is zero point in excluding patients based on some demographic or other factor if it has no relationship to the outcome.

**Selected reading:**

[Enrollment of Racial Minorities in Clinical Trials: Old Problem Assumes New Urgency in the Age of Immunotherapy](https://pubmed.ncbi.nlm.nih.gov/31099618/)

[Eligibility Criteria of Randomized Controlled Trials Published in High-Impact General Medical Journals](https://jamanetwork.com/journals/jama/fullarticle/206151)

[Evaluating inclusion and exclusion criteria](https://www.federalregister.gov/documents/2018/08/23/2018-18232/evaluating-inclusion-and-exclusion-criteria-in-clinical-trials-workshop-report-availability)

[Why representativeness should be avoided](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3888189/) 

[Assessing and reporting heterogeneity in treatment effects in clinical trials: a proposal](https://trialsjournal.biomedcentral.com/articles/10.1186/1745-6215-11-85)

## Outcomes

We define the effects of interventions in terms of their impact on outcomes. In other words, outcomes are the variables we want to change in response to an intervention. So first and foremost, we must ensure that the outcomes we use in a trial are actually important, and be cautious about using so-called surrogate outcomes, which may reflect that the intervention did something, but not necessarily what we wanted it to do. Outcomes must also be precisely defined and of course measurable. Your description of an outcome should also avoid any qualitative statements (e.g. systolic blood pressure is an outcome, while “improved” systolic blood pressure is not).

Our choice of outcomes will also have important implications for the overall design of the trial. Generally, outcome that are noisier (have more natural variance, which is typical of subjective measures), or rarer, will require a greater sample of patients to demonstrate the effect of an intervention. That said, we must often accommodate this if those in fact are the most important outcomes. However, one avoidable but still frequently made mistake is the categorization of inherently continuous outcomes, which always results in a loss of information and needlessly lowers the power of the study (and even if some categorized outcome is perceived as being more relevant, this can always be captured from the analysis of the underlying continuous outcome).

**Selected reading:**

[The perils of surrogate endpoints](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4554958/)

[Disease-free survival is not a surrogate endpoint for overall survival in adjuvant trials of pancreatic cancer: a systematic review of randomized trials]()

[Cardiology World Erupts Into Controversy Over Change In Major Clinical Trial (outcome switching)](https://www.cardiobrief.org/2018/03/18/cardiology-world-erupts-into-controversy-over-change-in-major-clinical-trial/) 

[FDA draft guidance on multiple endpoints](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/multiple-endpoints-clinical-trials-guidance-industry)

## Covariates

There is some disagreement among trialists about how to treat covariate information. In general, model based adjustment for strong predictors of the outcome will result in a more efficient (more powerful) estimator of the treatment effect. This means we don’t need to enroll as many patients on the trial to detect the minimally important effect size (or we have even higher power to detect this effect with the same number of patients). This part is uncontroversial. However, some people see any covariate adjustment as a problem, especially if they suspect that the choice of covariates to adjust for is made after seeing the data, with the intent to produce a small p-value for the effect of the intervention (p-hacking). Other people are fine with covariate adjustment, but they choose their covariates based on perceived imbalances in the covariate distributions between trial arms (so called “table 1 tests”). However, this procedure is sub-optimal, recommended against by all competent authorities, and opens the investigator up to the accusations of p-hacking we just discussed.  

The correct way to account for covariate information is to use your subject matter expertise and understanding of the outcome to select the strongest prognostic factors before the study begins, and to pre-register these decisions in the statistical analysis plan attached to the clinical trial registration. Then the reported analyses at the end of the study much match what was declared in the registration (and thus couldn’t have been p-hacked).

The final point is how to handle baseline information. **The** baseline is a measure of the outcome that is taken prior to randomization. Baselines are thus often powerful predictors of the later outcome and thus a good choice for model based adjustment. However, instead of this, some investigators calculate change scores (outcome minus baseline) and use that for the outcome in the eventual trial analysis.  What they don’t realize is that such a change score will still be correlated with the baseline values (but now in the opposite direction), and thus still benefit from an adjustment for baseline – and that the estimated effect of an intervention on the change score adjusted for baseline will be exactly the same as that on the (raw) outcome adjusted for baseline. While there are some scenarios where the unadjusted estimator of the treatment effect will be more efficient using change scores vs raw outcome, the baseline adjusted estimator is always more efficient than unadjusted change scores.

**Selected reading:**

[The risks and rewards of covariate adjustment in randomized trials: an assessment of 12 outcomes from 8 studies](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4022337/)

[Substantial and confusing variation exists in handling of baseline covariates in randomized controlled trials: a review of trials published in leading medical journals](https://www.sciencedirect.com/science/article/pii/S0895435609001747)

[The use of percentage change from baseline as an outcome in a controlled trial is statistically inefficient: a simulation study](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC34605/)

[Out of balance](https://medium.com/@darren_dahly/out-of-balance-9021fd636d88)

## Randomization and allocation concealment

In the module, we discussed the importance of randomization for preventing any selection bias when recruiting patients into the trial. To actually accomplish this, we must maintain strict allocation concealment, which requires that the following are true:

- The allocation for a patient cannot possibly be known by the trial staff until after they are unambiguously and irreversibly enrolled onto the trial (this of course doesn't mean they can't drop out of the trial, they just can't disappear without a trace as if never enrolled). 

- Once a patient is allocated, their allocation cannot be altered (again, this of course doesn't mean that they can't be moved onto another treatment, just that their initial allocation can't be changed without any indication).

Given the importance of allocation concealment for preventing selection bias, and for subsequent blinding, its critically important that investigators use trustworthy **systems** that don't rely on the trustworthiness of investigators. Thus computer databases and remote services should be used in serious trials, and stuffed envelopes should generally be avoided. 

Finally, with respect to the randomization list itself, we discussed restriction and stratification. Given that estimators are more efficient when there is an even split of participants across study arms, it can be a good idea to restrict the randomization list to force equal (or very nearly equal) allocation of patients across arms. However, in larger samples (n > 100 maybe), the probability of an imbalance in numbers large enough to appreciably affect the estimator's efficiency gets very small very quickly. 

However, there is another reason to restrict a randomization list and that is when we decide to stratify on one or more key factors that are prognostic for the outcome. There is a wide-spread misconception about stratification which is that we use it to prevent covariate imbalances across study arms (i.e. to prevent the distribution of some important covariate from being notably different between arms). Importantly, however, this is an incomplete solution to that problem, because if we force balance in a covariate by stratifying on it, we then need to adjust for that covariate in our statistical model - to not do so would be analogous to treating matched data as if they were unmatched. In other words, you must "analyze as you randomize" (Senn). Further, by adjusting for the covariate, you fix the problem you were trying to solve with the stratification, even if you don't stratify! However, stratification, when feasible, is still a good idea, because it forces balanced distribution of study arms (which is why a stratified list must be restricted) within strata, which, as noted above, leads to more efficient estimators. 

**Selected reading:**

[Seven myths of randomisation in clinical trials Links to an external site](https://onlinelibrary.wiley.com/doi/abs/10.1002/sim.5713)

[How to randomize](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC2596474/)

## Module Text

[Statistical Issues in Drug Development (UCC Library Link)](https://library.ucc.ie/search?/Xstatstical+issues+in+drug+development&SORT=D/Xstatstical+issues+in+drug+development&SORT=D&SUBKEY=statstical+issues+in+drug+development/1%2C25682%2C25682%2CB/frameset&FF=Xstatstical+issues+in+drug+development&SORT=D&4%2C4%2C)