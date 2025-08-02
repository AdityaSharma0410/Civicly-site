import Layout from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Input } from "@/components/ui/input";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table";
import { FileDown, Filter, Search, Eye, Flag, AlertTriangle } from "lucide-react";
import React, { useEffect, useState } from "react";

const flaggedReports = [
  {
    id: "ISS-1234",
    title: "Pothole on Main Street",
    reporter: "Anonymous",
    flags: 3,
    reason: "Duplicate report",
    date: "2024-06-30"
  },
  {
    id: "ISS-1235",
    title: "Garbage overflow",
    reporter: "John Smith", 
    flags: 5,
    reason: "Inappropriate content",
    date: "2024-06-29"
  },
  {
    id: "ISS-1236",
    title: "Broken streetlight",
    reporter: "Anonymous",
    flags: 2,
    reason: "Spam",
    date: "2024-06-29"
  }
];

export default function Reports() {
  const [reports, setReports] = useState<any[]>([]);
  useEffect(() => {
    fetch("http://localhost:8080/api/reports")
      .then((res) => res.json())
      .then((data) => setReports(data));
  }, []);

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex justify-between items-center">
          <div>
            <h1 className="text-3xl font-bold tracking-tight">Reports & Analytics</h1>
            <p className="text-muted-foreground">Generate and manage system reports</p>
          </div>
          <Button>
            <FileDown className="h-4 w-4 mr-2" />
            Generate New Report
          </Button>
        </div>

        {/* Quick Actions */}
        <div className="grid gap-4 md:grid-cols-3">
          <Card className="cursor-pointer hover:shadow-md transition-shadow">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-2 bg-primary/10 rounded-lg">
                  <FileDown className="h-6 w-6 text-primary" />
                </div>
                <div>
                  <h3 className="font-semibold">Monthly Summary</h3>
                  <p className="text-sm text-muted-foreground">All issues for current month</p>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card className="cursor-pointer hover:shadow-md transition-shadow">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-2 bg-success/10 rounded-lg">
                  <AlertTriangle className="h-6 w-6 text-success" />
                </div>
                <div>
                  <h3 className="font-semibold">Performance Report</h3>
                  <p className="text-sm text-muted-foreground">Resolution metrics</p>
                </div>
              </div>
            </CardContent>
          </Card>
          
          <Card className="cursor-pointer hover:shadow-md transition-shadow">
            <CardContent className="p-6">
              <div className="flex items-center space-x-4">
                <div className="p-2 bg-warning/10 rounded-lg">
                  <Flag className="h-6 w-6 text-warning" />
                </div>
                <div>
                  <h3 className="font-semibold">Moderation Report</h3>
                  <p className="text-sm text-muted-foreground">Flagged issues summary</p>
                </div>
              </div>
            </CardContent>
          </Card>
        </div>

        {/* Generated Reports */}
        <Card>
          <CardHeader>
            <div className="flex justify-between items-center">
              <CardTitle>Generated Reports</CardTitle>
              <div className="flex items-center space-x-2">
                <div className="relative">
                  <Search className="absolute left-2 top-2.5 h-4 w-4 text-muted-foreground" />
                  <Input placeholder="Search reports..." className="pl-8 w-64" />
                </div>
                <Select>
                  <SelectTrigger className="w-32">
                    <SelectValue placeholder="Type" />
                  </SelectTrigger>
                  <SelectContent>
                    <SelectItem value="all">All Types</SelectItem>
                    <SelectItem value="summary">Summary</SelectItem>
                    <SelectItem value="performance">Performance</SelectItem>
                    <SelectItem value="analytics">Analytics</SelectItem>
                  </SelectContent>
                </Select>
              </div>
            </div>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Report ID</TableHead>
                  <TableHead>Title</TableHead>
                  <TableHead>Type</TableHead>
                  <TableHead>Period</TableHead>
                  <TableHead>Status</TableHead>
                  <TableHead>Generated By</TableHead>
                  <TableHead>Date</TableHead>
                  <TableHead>Actions</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {reports.map((report) => (
                  <TableRow key={report.id}>
                    <TableCell className="font-mono">{report.id}</TableCell>
                    <TableCell>{report.title}</TableCell>
                    <TableCell>
                      <Badge variant="outline">{report.type}</Badge>
                    </TableCell>
                    <TableCell>{report.period}</TableCell>
                    <TableCell>
                      <Badge variant={report.status === "Ready" ? "status-resolved" : "status-progress"}>
                        {report.status}
                      </Badge>
                    </TableCell>
                    <TableCell>{report.generatedBy}</TableCell>
                    <TableCell>{report.date}</TableCell>
                    <TableCell>
                      <div className="flex items-center space-x-2">
                        <Button variant="ghost" size="sm">
                          <Eye className="h-4 w-4" />
                        </Button>
                        <Button variant="ghost" size="sm">
                          <FileDown className="h-4 w-4" />
                        </Button>
                      </div>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </CardContent>
        </Card>

        {/* Flagged Issues */}
        <Card>
          <CardHeader>
            <CardTitle className="flex items-center gap-2">
              <Flag className="h-5 w-5" />
              Flagged Issues Pending Review
            </CardTitle>
          </CardHeader>
          <CardContent>
            <Table>
              <TableHeader>
                <TableRow>
                  <TableHead>Issue ID</TableHead>
                  <TableHead>Title</TableHead>
                  <TableHead>Reporter</TableHead>
                  <TableHead>Flags</TableHead>
                  <TableHead>Reason</TableHead>
                  <TableHead>Date</TableHead>
                  <TableHead>Actions</TableHead>
                </TableRow>
              </TableHeader>
              <TableBody>
                {flaggedReports.map((issue) => (
                  <TableRow key={issue.id}>
                    <TableCell className="font-mono">{issue.id}</TableCell>
                    <TableCell>{issue.title}</TableCell>
                    <TableCell>{issue.reporter}</TableCell>
                    <TableCell>
                      <Badge variant="destructive">{issue.flags} flags</Badge>
                    </TableCell>
                    <TableCell>{issue.reason}</TableCell>
                    <TableCell>{issue.date}</TableCell>
                    <TableCell>
                      <div className="flex items-center space-x-2">
                        <Button variant="outline" size="sm">Review</Button>
                        <Button variant="destructive" size="sm">Remove</Button>
                      </div>
                    </TableCell>
                  </TableRow>
                ))}
              </TableBody>
            </Table>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
}