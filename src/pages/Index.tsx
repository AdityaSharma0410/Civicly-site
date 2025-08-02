import Layout from "@/components/Layout";
import { DashboardStats } from "@/components/DashboardStats";
import { IssuesTable } from "@/components/IssuesTable";

const Index = () => {
  return (
    <Layout>
      <div className="p-6">
        <div className="mb-8">
          <h2 className="text-3xl font-bold tracking-tight">Dashboard Overview</h2>
          <p className="text-muted-foreground">
            Monitor and manage civic issues reported by citizens
          </p>
        </div>
        
        <div className="space-y-6">
          <DashboardStats />
          <IssuesTable />
        </div>
      </div>
    </Layout>
  );
};

export default Index;
