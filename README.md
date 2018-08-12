# Three-Phase_Unbalanced_System

实验目的：
用opendss搭建一个三相不平衡系统，得到潮流运算结果；再用matpower和matlab编程实现过程，使得的两个程序的结果match。OpenDSS软件可以进行unbalanced三相系统运行并计算潮流。我的想法，是使用MATLAB软件，模拟出unbalanced三相系统运算潮流的过程，并使之结果与OpenDSS软件的结果相匹配，从而对三相unbalanced系统达到更深刻的认识和了解。
首先，我在OpenDSS中设计一个三节点三相系统，其连接方式可描述为：VSource——变压器支路——传输线支路——load。其中，传输线是三相不平衡的。运行潮流计算成功后，再用MATPOWER进行模拟并进行潮流计算，直到电压和功率的计算结果与OpenDSS互相匹配（match）。在这个过程中，我发现MATPOWER的计算原理是将3-ph balanced系统以单相表示并进行潮流计算；故而使用MATPOWER无法实现3-ph unbalanced潮流计算。所以，改用MATLAB编写程序进行潮流计算。最终，实现了三节点三相系统with unbalanced传输线，在负荷分别是load wye connection 和load delta connection两种情况下，进行系统的潮流计算。

实验过程：
1.	使用OpenDSS软件设计出一个可以正常运行且潮流计算结果收敛（converged）的三相balanced系统，包含Vsource，变压器，传输线，和load这几种元素。所有元素均为balanced，即系统的Y矩阵的每个子矩阵都只为3×3对角阵且这3个元素相同。
2.	使用MATPOWER对上述系统进行模拟，直至结果match，即潮流运算结果能算出与OpenDSS一样的每节点电压标幺值，和每节点功率标幺值。作折线图进行对比，两条折线应重合。在此过程中，我发现，OpenDSS计算带有变压器的系统的方式与我们通用的计算方式不同；所以，相应的MATPOWER的相关位置填写需要采取一定方法。
3.	将OpenDSS软件设计的系统传输线部分更改为三相unbalanced，并尝试用MATPOWER进行模拟。结果发现，由于节点导纳矩阵Y计算方式与先前不同，导致MATPOWER无法完成运算。
4.	换用MATLAB编写潮流程序，依然和MATPOWER一样进行标幺值运算。三相unbalanced系统不能再以单相代表三相，所以，Y矩阵的计算方式进行大改，变成9×9矩阵，但是系统依然是3节点系统。只不过，把原先的3（节点）×3（节点）矩阵的每个元素扩充成为一个3（相）×3（相）的子矩阵，从而得到9×9的Y矩阵。而且，为了具体specify每相情况，电压及其基准值，标幺值，均改为VLN，即line to neutral voltage。功率基准值也改为单相功率基准值。电压标幺值VLN与VLL相等；功率标幺值三相与单相相等。最终，使程序运行结果电压和功率均与OpenDSS相match。
5.	将Load由三相balanced -Y接改为三相unbalanced – delta接；并通过MATLAB程序，实现：在三相unbalanced系统中节点注入三相unbalanced – delta接Load，进行潮流计算，并运行出与OpenDSS相match的结果。由于三相unbalanced 系统Y矩阵被在MATLAB中被体现为9×9矩阵（标幺值），所以，功率注入节点的三相load应表现为每相（也就是3个）功率（Sa, Sb, Sc）的标幺值；但是如果load为delta接法，则只能知道Sab, Sbc和Sac，而不能立刻明确每一相注入的功率（Sa, Sb, Sc）应是多少。这里通过对load 端列写KCL方程，求得load prim matrix，继而可以利用load prim matrix编写程序，通过迭代，求出每一相注入的功率（Sa, Sb, Sc），从而完成将delta-load转变为wye-load的过程。



Dear Professor xxx,

I am Lixue Zhang, a MS student from NYU Tandon School, majoring in EE Power area. During this semester, I completed a project related to the three-phase unbalanced power system. If you have some interest in it, I really wish to know if there is any chance for me to do a presentation, and to show the details to you.

The outline of the experiment is constructing a three-phase unbalanced system using OpenDSS, and obtaining the results of power flow calculation; then using another software, like MATPOWER or MATLAB, to achieve the power flow calculation of this system; and finally, making the results (for example, voltage and power) match with the results of OpenDSS. 

It is known that OpenDSS is a perfect tool to operate and analyze a three-phase unbalanced system. Therefore, I hoped to simulate the power flow calculation of three-phase unbalanced system using MATLAB or MATPOWER, and to match the results (voltage and power) with OpenDSS. From this, I have got a deeper understanding about the three-phase unbalanced system. 

Firstly, via OpenDSS, I designed a three-node three-phase system, which is connected as: VSource --- Transformer Branch--- Transmission Line Branch --- Load. The transmission line is unbalanced here. After calculating the power flow, I used MATPOWER to simulate the whole process until the results matched with OpenDSS. During this process, I found because MATPOWER always uses single phase to present three phases (as balanced system), it cannot run the calculation of three-phase unbalanced system. Then I revised the System Y matrix, and tried to use MATLAB to write a program to do it in a different way from MATPOWER. Finally, I accomplished my work. I completed the power flow calculation of a three-node three-phase system with unbalanced transmission line. What's more, I also figured out how to calculate it with a delta-connected 3-phase load which is mostly different from wye-connected load, using MATLAB. 

Actually, this is just a simplified summarization. I'm writing a PPT and preparing for demonstration; and I'm really excited if you could agree to give me the opportunity to present the details. I cherish this opportunity very much and believe that I have learned a lot from the project. It improved me to obtain more profound knowledge of the power system operation; and I deeply wish to have more chance to do further study. However, there is not enough time left since I'm graduating this month; I have to find a job after graduation. Therefore, I really hope to have a chance to show you what I learned up to now; and if you feel satisfied with me, I sincerely wish I could get your recommendation when I apply for job later. A reference from a prestigious professor like you must be a great help for me. Could you please give me the chance? I am looking forward to speaking with you soon. 

Thank you for your attention.

Sincerely,
Lixue
