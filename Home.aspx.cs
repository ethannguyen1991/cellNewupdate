﻿using System;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Linq;

public partial class Home : Page
{
    private Random random;
    protected void Page_Load(object sender, EventArgs e)
    {
        random = new Random();
        #region Validating session
        if (Session["UserID"] == null || Session["IsStudent"] == null)
        {
            Response.Redirect("index.html", false);
            ApplicationInstance.CompleteRequest();
        }
        #endregion
        Session["ScenarioID"] = null;
        Session["HideComment"] = null;
        string decsription = @"A student or pupil is a learner or someone who attends an educational institution. In Britain those attending university are termed 
                                A student or pupil is a learner or someone who attends an educational institution. In Britain those attending university are termed 
                                A student or pupil is a learner or someone who attends an educational institution. In Britain those attending university are termed 
                                A student or pupil is a learner or someone who attends an educational institution. In Britain those attending university are termed ";
        if (!IsPostBack)
        {
            if (Convert.ToInt32(Session["IsStudent"]) == 1)
            {
                lblwelcome.Text = "Welcome Student :" + Session["UserName"];
                lblweldescp.Text = decsription;
            }
            else
            {
                lblwelcome.Text = "Welcome Admin :" + Session["UserName"];
                lblweldescp.Text = "";
                pnlAdmin.Visible = true;
                SetDashboardForAdmin();
            }

                
        }
    }


    public void SetDashboardForAdmin()
    {
        using (CellEntities context = new CellEntities())
        {
            var scenariocount = (from rs in context.Scenarios select rs.Name).ToList().Count();
            var contentcount = (from rs in context.Contents select rs.HeadingID).ToList().Count();
            var studentcount = (from rs in context.Accounts select rs.AccountId).ToList().Count();
            lblscenario.Text = @"Available no of scenario  " + scenariocount.ToString();
            lblcontent.Text = @"Available no of conent  " + contentcount.ToString();
            lblstudetn.Text = @"Available no of student  " + studentcount.ToString();
            
        };
    }

    public int getRandomScenarioId() 
    {
        try
        {
            #region Bind scenario to data list
            using (SqlConnection con = new SqlConnection())
            {
                con.ConnectionString = ConfigurationManager.ConnectionStrings["CPDBCS"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "ShowScenario";
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Clear();
                cmd.Parameters.Add("@UserID", SqlDbType.Int).Value = Session["UserID"].ToString();
                cmd.Connection = con;
                con.Open();

                //Unload data into data set and convert to list
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds, "Scenario");
                if (ds.Tables["Scenario"].Rows.Count > 0)
                {
                    var scenarioList = ds.Tables[0].AsEnumerable().ToList();//convert to list
                    var randomNumber = random.Next(scenarioList.Count);//generate random number
                    return (int)scenarioList[randomNumber][1];//return the random scenario id
                    
                }else
                {
                    return -1;
                }
            };
        }
        catch (Exception ex)
        {
            return -1;
            throw;
        }
        return -1;
        #endregion
    }
    protected void btnRandomStart_Click(object sender, EventArgs e){
        var randomScenarioId = getRandomScenarioId();

        Session["ScenarioID"] = randomScenarioId;
        Response.Redirect("ScenarioDetail.aspx", false);
        ApplicationInstance.CompleteRequest();
    }
    protected void btnstartGame_Click(object sender, EventArgs e)
    {
        Response.Redirect("ShowScenarios.aspx", false);
        ApplicationInstance.CompleteRequest();
    }
}