<%@ Page Title="" Language="C#" MasterPageFile="~/main.master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="ProjectFLAME.diamondsadan.index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    p:first-letter {
        font-size: 120%;
    }
    p {
        font-size: 100%;
    }
</style> 
       
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="navScript" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="content" runat="server">
<div class="container">
    <div class="row">
        <div class="col-xs-12">
            <h1>Diamond Sedan Competition 2013<small>Academic Team Semi-Final</small><br />抬「鑽轎」比賽2013<small>學界組初賽</small></h1>
            <div class="row">
                <div class="col-sm-12" style="text-align: center">
                	<a href='#modal1' data-toggle='modal' data-target='#modal1' class="btn btn-danger btn-lg">Register Now!</a>
                    <p></p>
                </div>
            </div>
            <%=Resources.langDiamond.String1%>
            <!--<div class="row">
                <div class="col-sm-7">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">關於抬「鑽轎」比賽:</h4>
                            <div class="list-group-item-text">
                                <ul>
                                    <li>
                                        <p>抬「鑽轎」比賽始於2012，旨在提高大眾對輪椅使用者福利的關注並鼓勵傷健人士獲得精彩。比賽由鑚的（香港）有限公司設計，參賽者將抬起輪椅載有使用者的特製「鑽轎」完成賽跑。[<a href="Download/Competition Rules (English).pdf" target="_blank">规则</a>]</p>
                                        <p>抬「鑽轎」比賽 （學界組初賽）由香港城市大學火焰計劃及鑚的聯合舉辦，鼓勵學界參與推廣關懷輪椅使用者的文化及社會企業的概念。</p>
                                        <p>學界組初賽將產生四隊入圍隊伍進入12月15日於赤柱舉行的決賽。</p>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">參賽資格:</h4>
                            <ul>
                                <li>所有年滿十八歲的中學生及大學生。</li>
                                <li>每隊應有至少6名最多10名成員。</li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">日期及地點:</h4>
                            <ul>
                                <li>學界組初賽：11月17日（已延期）- 民生書院（九龍城）</li>
                                <li>決賽：12月15日- 赤柱大街</li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">學界組初賽費用:</h4>
                            <ul>
                                <li>每隊$500港幣（請參閱備註1）</li>
                            </ul>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">重要日期:</h4>
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <td>項目</td>
                                        <td>提交日期</td>
                                        <td>提交方法</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            報名表（網上）
                                        </td>
                                        <td>2013年11月3日</td>
                                        <td><a href='#modal1' data-toggle='modal' data-target='#modal1'>網上表格</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="Download/Crew List Form.xls" target="_blank">隊員名單表</a></td>
                                        <td rowspan="3">2013年11月8日</td>
                                        <td>電郵至<a href="mailto:hangchow2@cityu.edu.hk">hangchow2@cityu.edu.hk</a></td>
                                    </tr>
                                    <tr>
                                        <td><a href="Download/Team Declaration Form (Englsih).pdf" target="_blank">參賽聲明表（英文）</a></td>
                                        <td rowspan="2">
                                            <h4>郵遞至:</h4>
                                            九龍塘香港城市大學教學樓（一），B7302，公共政策系，火焰計劃
                                            <h4>Or</h4>
                                            <h4>Come to Project FLAME Office in person:</h4>
                                            九龍塘桃源街香港城市大學桃源樓，一座3A<br />
                                            電郵：hangchow2@cityu.edu.hk<br />
                                            電話：3442 6221
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>報名費<br />
                                        港幣五百塊<br />
                                        *以劃線支票提交。抬頭：香港城市大學 
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">準備資料:</h4>
                            <ol>
                                <li>11月10日（暫定）將舉行練習，讓準參賽者熟悉比賽規則及方式。詳情將於稍後公佈.</li>
                                <li>已閱讀並且了解<a href="Download/Competition Rules (English).pdf" target="_blank">比賽規則（英文）</a></li>
                                <li>已閱讀並且了解<a href="Download/Safety Guide.pdf" target="_blank">安全措施 （英文）</a></li>
                            </ol>
                        </li>
                        <li class="list-group-item">
                            <h4 class="list-group-item-heading">備註:</h4>
                            <ul>
                                <li>四隊學界初賽入圍隊伍需繳付港幣$4,500以進入於赤柱舉辦的決賽。如有需要，火焰計劃及鑚的會與所屬機構聯絡，尋求贊助。舉辦單位亦會為初賽勝出隊伍提供所需協助以獲得決賽贊助。</li>
                                <li>抬「鑽轎」比賽決賽報名費用安排將有鑚的（香港）有限公司作決定及最終安排。詳情容後公佈。</li>
                                <li>如勝出隊伍最終未能繳交決賽報名費或因其他原因未能參與決賽，決賽名額將自動轉移至下一個隊伍（按初賽比賽成績排名）。</li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div class="col-sm-5">
                    <div class="panel panel-default">
                        <div class="panel-heading">Gallery</div>
                        <div class="panel-body" style="padding: 0">
                            <div id="carousel-member" data-interval="2000" class="carousel slide">
                                <ol class="carousel-indicators">
                                    <li data-target="#carousel-member" data-slide-to="0" class="active"></li>
                                    <li data-target="#carousel-member" data-slide-to="1"></li>
                                    <li data-target="#carousel-member" data-slide-to="2"></li>
                                    <li data-target="#carousel-member" data-slide-to="3"></li>
                                    <li data-target="#carousel-member" data-slide-to="4"></li>
                                    <li data-target="#carousel-member" data-slide-to="5"></li>
                                    <li data-target="#carousel-member" data-slide-to="6"></li>
                                    <li data-target="#carousel-member" data-slide-to="7"></li>
                                    <li data-target="#carousel-member" data-slide-to="8"></li>
                                </ol>
                                <div class="carousel-inner">
                                    <div class="item active">
                                        <img style="width: 100%" src="Photos/1.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/2.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/3.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/4.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/5.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/6.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/7.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/8.jpg" alt="...">
                                    </div>
                                    <div class="item">
                                        <img style="width: 100%" src="Photos/9.jpg" alt="...">
                                    </div>
                                </div>

                                <a class="left carousel-control" href="#carousel-member" data-slide="prev">
                                    <span class="icon-prev"></span>
                                </a>
                                <a class="right carousel-control" href="#carousel-member" data-slide="next">
                                    <span class="icon-next"></span>
                                </a>
                                <script type="text/javascript">
                                    $(function(){$('.carousel').carousel();});
                                </script>
                            </div>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">Event Calendar</div>
                        <div class="panel-body" style="padding: 0">
                            <ul class="list-group" style="border: none; margin: 0">
                                <li class="list-group-item" style="border: none">
                                    <h4 class="list-group-item-heading">23 Sept 2013 – 15 Oct 2013:</h4>
                                    <div class="list-group-item-text">
                                        Registration Period for Academic Team Semi-Final
                                    </div>
                                </li>
                                <li class="list-group-item" style="border: none">
                                    <h4 class="list-group-item-heading">22 Oct 2013:</h4>
                                        Pre-competition Training 
                                </li>
                                <li class="list-group-item" style="border: none">
                                    <h4 class="list-group-item-heading">27 Oct 2013 12:00 - 4:30pm:</h4>
                                        Academic teams Semi-Final @ Mungsang College 
                                </li>
                                <li class="list-group-item" style="border: none">
                                    <h4 class="list-group-item-heading">Nov 2013:</h4>
                                    <ol>
                                        <li>Semi-finalist registering for Final </li>
                                        <li>Details and dates to be announced by Diamond Cab</li>
                                    </ol>
                                </li>
                                <li class="list-group-item" style="border: none">
                                    <h4 class="list-group-item-heading">15 Dec 2013:</h4>
                                        Final @ Stanley Main Street
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="panel panel-default">
                        <div class="panel-heading">Contact Us</div>
                        <div class="panel-body" style="padding: 0">
                            <ul class="list-group" style="border: none; margin: 0">
                                <li class="list-group-item" style="border: none"><h5 class="list-group-item-heading"><i class="icon-map-marker"></i>Address:</h5>
                                3A, Block 1, To Yuen Building, To Yuen Street, Kowloon, Hong Kong.</li>
                                <li class="list-group-item" style="border: none"><h5 class="list-group-item-heading"><i class="icon-user"></i>Tel:</h5>(852)3442 6221</li>
                                <li class="list-group-item" style="border: none"><h5 class="list-group-item-heading"><i class="icon-print"></i>Fax:</h5>(852)3442 0132</li>
                                <li class="list-group-item" style="border: none"><h5 class="list-group-item-heading"><i class="icon-envelope"></i>Email:</h5><a href="mailto:hangchow2@cityu.edu.hk">hangchow2@cityu.edu.hk</a></li>
                                <li class="list-group-item" style="border: none"><h5 class="list-group-item-heading"><i class="icon-time"></i>Opening Hour:</h5>Mon-Fri:<br>  9:00 am-6:00 pm<br>  (Lunch Break: 12:30 pm-2:00 pm)</li>

                            </ul>
                        </div>
                    </div>

                </div>
            </div>-->
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-sm-12" style="text-align: center">
            <a href='#question' data-toggle='modal' data-target='#question' class="btn btn-info btn-sm">Frequently Asked Questions<br />-常見問題-</a>
            <hr />
            <a href='#modal1' data-toggle='modal' data-target='#modal1' class="btn btn-danger btn-lg">Register Now!</a>
            <p><small>Project Flame reserves all rights of the semi-final competition’s final explanation. </small></p>
        </div>
    </div>
</div>
<!--Modal part-->
<div id='modal1' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>x</button>
                <h3>What you need to do in order to finish registration?</h3>
            </div>
            <div class='modal-body'>
                <div class="alert alert-success"><h5>First, complete the online registration form</h5></div>
                <div style="text-align: center">
                    <iframe style="width: 630px; min-height: 700px; border: none" src="https://docs.google.com/forms/d/1jjIuzFSXUk81TjQhB1Wi4GvpABhgVDGH0x-Hk0ofHtE/viewform"></iframe>
                </div>
                <div class="alert alert-success"><h5>Second, complete the online <a href="Download/Crew List Form.xls" target="_blank">Crew List</a> Form on or before 18 Oct 2013</h5></div>
                <div class="alert alert-success"><h5>Then, return the completed AND sign the <a href="Download/Team Declaration Form (Englsih).pdf" target="_blank">Team Declaration Form</a> to Project Flame by mail or in person</h5></div>
                <div class="alert alert-success">
                    <h5>After, submit Registration Fee (HKD 500) by crossed cheque to Project Flame by mail or in person. The cheque should be payable to “City University of Hong Kong”. Please write the name of the team, institution, and the contact number of the contact person at the back of the cheque
                        <ul>
                            <li>Send the Cheque and the Team Declaration Form by Mail<br />
                            <small>Mail Address: Project Flame, Department of Public Policy, B7302, Academic Building 1, City University of Hong Kong, Kowloon</small></li>

                            <li>Submit in Person<br />
                            <small>Project Flame Office: Room 3A, 3/F, To Yuen Building, City University of Hong Kong, To Yuen Street, Kowloon</small></li>

                        </ul>
                    </h5>
                </div>
            </div>
            <div class='modal-footer'>
                <button class='btn' data-dismiss='modal' aria-hidden='true'>Close</button> 
            </div>
        </div>
    </div>
</div>
<div id='question' class='modal fade' tabindex='-1' role='dialog' aria-labelledby='myModalLabel' aria-hidden='true'>
    <div class='modal-dialog'>
        <div class='modal-content'>
            <div class='modal-header'>
                <button type='button' class='close' data-dismiss='modal' aria-hidden='true'>x</button>
                <h3>Frequently Asked Questions</h3>
            </div>
            <div class='modal-body'>
                <ol>
                    <li>
                        <h4>
                            What does Diamond Cab do? How does the competition work? 
                            <br />
                            什麽是鑚的？什麽是抬「鑽轎」比賽?
                        </h4>
                        Diamond Cab is an award-winning social enterprise offering point-to-point transportation services for wheelchair users. They have 5 barrier-free cabs that allow wheelchair users to board directly and provides a legal and safe transportation means for wheelchair users and their carers. Up to October 2012, they have successfully completed over 27,000 barrier-free trips.<br/>
                        The competition is a race where wheelchair users ride in specially designed sedan chairs. Participating teams will carry the sedan chairs and complete the race for two rounds, approximately 360 meters in total. The finalists will be determined by completed the competition with the shortest time.
                        <br />
                        鑽的(香港)有限公司是一間獲獎社會企業，為輪椅使用者提供點到點接載服務的，擁有五部可方便輪椅直接上落的無障礙的士，為輪椅使用者及照顧者帶來合法而安全的交通接載，直至二零一二年十月底，鑽的已成功接載了超過二萬七千輪椅乘客人次。<br/>抬「鑽轎」比賽由鑚的（香港）有限公司設計，參賽者將抬起輪椅載有使用者的特製「鑽轎」完成兩個會合的賽跑，合共約三百六十米 (360m)。比賽將會以最短時間完成比賽的規則以決定進入決賽名額。

                    </li>
                    <li>
                        <h4>
                            What is the purpose of the competition? 
                            <br />
                            這個比賽的目的是什麼?
                        </h4>
                        The competition aims to raise awareness on welfare of wheelchair users and promoting the philosophy that helping the disabled can lead to brilliant fulfilling lives.
                        <br />
                        這個比賽旨在旨在提高大眾對輪椅使用者福利的關注並鼓勵傷健人士獲得精彩。
                    </li>
                    <li>
                        <h4>
                            How can the wheelchair users benefit from the competition?
                            <br />
                            這個比賽如何令到輪椅使用者受惠?
                        </h4>
                        The net proceeds (after deducting costs) will go to Diamond Cab (HK) Limited for the enhancement of their service to wheelchair users. The message of caring and mutual respect will also be carried forward when the young participants and the wheelchair users interact during the competition.
                        <br />
                        這個比賽的收益（扣除成本）將會全數撥入鑽的（香港）有限公司的日常營運，以提升他們的服務質素，從而改善輪椅使用者的生活素質。透過參與這個比賽，青年參加者與輪椅使用者之間的交流將會加強關愛與互相尊重等正面訊息的推廣。
                    </li>
                    <li>
                        <h4>
                            Who are eligible for the competition? 
                            <br />
                            參加者需要合符什麼條件?
                        </h4>
                        All students from secondary schools and tertiary institutions who are above 18 years old are eligible for the competition.
                        <br />
                        所有報名者必須是十八歲或以上的大專程度學生。
                    </li>
                    <li>
                        <h4>
                            Do we have to pay for the registration fee? 
                            <br />
                            有意報名者需要繳交參賽費用嗎?
                        </h4>
                        Each team has to pay five-hundred ($500) Hong Kong Dollars for joining the semi-final and the extra fee for the four finalists of finals are four thousand and five-hundred ($4,500) Hong Kong Dollars. Project Flame and Diamond Cab will contact concerned institutions and provide support for teams to obtain sponsorship, if needed.
                        <br />
                        每組參賽組別需要繳交五百元($500)港幣作為參加初賽費用。順利進入決賽的四隊需額外繳交四千五百元($4,500)作為決賽費用。如有需要火焰計劃及鑚的將聯絡有關機構並協助取得贊助。
                    </li>
                    <li>
                        <h4>
                            How do we pay for the registration fee? 
                            <br />
                            參加者如何能夠繳交參賽費用?
                        </h4>
                        Amount: $500 in crossed Cheque *Payable to “City University of Hong Kong”. There are two ways you can mail to:
                        Project Flame, Department of Public Policy, B7302, Academic Building 1, City University of Hong Kong, Kowloon<br />
                        Or<br />
                        Come to Project Flame Office in person:<br />
                        Project Flame Office: Room 3A, 3/F, To Yuen Building, City University of Hong Kong, To Yuen Street, Kowloon
                        * The cheque must arrive at the addresses written above on or before 6 November.<br /> 
                        有意參加者須以劃線支票形式繳交$500費用。<br />
                        抬頭(收款人)：香港城市大學。參加者可以透過以下兩種方式繳交費用。
                        郵寄: <br />
                        郵寄地址: 九龍塘香港城市大學教學樓（一），B7302，公共政策系，火焰計劃<br />
                        或<br />
                        親身繳款:<br /> 
                        地址: 九龍塘桃源街香港城市大學桃源樓一座3A<br />
                        *支票須於11月6日或之前寄至上地址
                    </li>
                    <li>
                        <h4>
                            How can I register for the competition? 
                            <br />
                            如何可以報名參賽?
                        </h4>
                        You can <a href="http://www6.cityu.edu.hk/projectflame/diamondsedan/index.aspx">register online</a>. 
                        <br />
                        答:參與者可以在<a href="http://www6.cityu.edu.hk/projectflame/diamondsedan/index.aspx">網上報名</a>.
                    </li>
                    <li>
                        <h4>
                            Do we have to form our own team? 
                            <br />
                            我們需要自行組隊嗎?
                        </h4>
                        Yes, you should register as a team. Please complete the following <a href="https://docs.google.com/forms/d/1jjIuzFSXUk81TjQhB1Wi4GvpABhgVDGH0x-Hk0ofHtE/viewform">online form</a>. 
                        <br />
                        這是必須的。請自行填寫<a href="https://docs.google.com/forms/d/1jjIuzFSXUk81TjQhB1Wi4GvpABhgVDGH0x-Hk0ofHtE/viewform">網上報名表</a>。
                    </li>
                    <li>
                        <h4>
                            How many team members are expected in a team? 
                            <br />
                            一隊需要有多少個成員?
                        </h4>
                        The team should consist of a minimum of 6 and maximum of 10 members.
                        <br />
                        一隊需要至少六個成員，最多十個成員。
                    </li>
                    <li>
                        <h4>
                            What documents do I need to submit before the competition? When do I need to submit them?
                            <br />
                            在比賽前，有什麼重要文件需要提交? 可以在哪裡提交?
                        </h4>
                        Online Registration Form needs to be submitted on or before 3 November. Crew List, Declaration Form and a crossed cheque of the registration fee for the semi-final competition (HK$500, payable to City University of Hong Kong) should be submitted on or before 6 November. Details please refer to the <a href="http://www6.cityu.edu.hk/projectflame/diamondsedan">event home page</a>.
                        <br />
                        網上申請表需要在十一月三日或之前提交。成員名單，聲明表格連同HK$500劃線支票（抬頭：香港城市大學）於十一月六日或之前提交。詳情請瀏覽<a href="http://www6.cityu.edu.hk/projectflame/diamondsedan">活動主頁</a>。
                    </li>
                    <li>
                        <h4>
                            How should I prepare for the competition?
                            <br />
                            參加者賽前應有何準備?
                        </h4>
                        Preparing for the Competition:<br />
                        A training session will be organized on 7 November (07/11). Team members should make time to attend. Details will be available soon. Each team member is required to read through the Competition Rules and the Safety Guide (downloadable on the homepage) before the completion.
                        <br />
                        在十一月七日將會提供一個訓練活動，隊員務必出席，詳細將會稍後公佈。每位參賽者需在比賽前自行閱讀所有比賽規則及安全守則（可於主頁下載）。
                    </li>
                </ol>
            </div>
            <div class='modal-footer'>
                <button class='btn' data-dismiss='modal' aria-hidden='true'>Close</button> 
            </div>
        </div>
    </div>
</div>

</asp:Content>
