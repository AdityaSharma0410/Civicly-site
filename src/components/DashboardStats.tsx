import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { FileText, Clock, CheckCircle, AlertTriangle } from "lucide-react";

const stats = [
  {
    title: "Total Issues",
    value: "1,247",
    change: "+12%",
    icon: FileText,
    color: "text-primary",
  },
  {
    title: "In Progress",
    value: "89",
    change: "+5%",
    icon: Clock,
    color: "text-warning",
  },
  {
    title: "Resolved",
    value: "1,098",
    change: "+18%",
    icon: CheckCircle,
    color: "text-success",
  },
  {
    title: "Urgent",
    value: "23",
    change: "-8%",
    icon: AlertTriangle,
    color: "text-destructive",
  },
];

export function DashboardStats() {
  return (
    <div className="grid gap-4 md:grid-cols-2 lg:grid-cols-4">
      {stats.map((stat) => (
        <Card key={stat.title}>
          <CardHeader className="flex flex-row items-center justify-between space-y-0 pb-2">
            <CardTitle className="text-sm font-medium">
              {stat.title}
            </CardTitle>
            <stat.icon className={`h-4 w-4 ${stat.color}`} />
          </CardHeader>
          <CardContent>
            <div className="text-2xl font-bold">{stat.value}</div>
            <p className="text-xs text-muted-foreground">
              {stat.change} from last month
            </p>
          </CardContent>
        </Card>
      ))}
    </div>
  );
}